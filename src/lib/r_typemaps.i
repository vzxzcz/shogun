/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This code is inspired by the python numpy.i typemaps, from John Hunter
 * and Bill Spotz.
 *
 * Written (W) 2008 Soeren Sonnenburg
 * Copyright (C) 2008 Fraunhofer Institute FIRST and Max-Planck-Society
 */

%{
#include "lib/common.h"
#include "lib/r.h"
%}

/* TYPEMAP_IN macros
 *
 * This family of typemaps allows pure input C arguments of the form
 *
 *     (type* IN_ARRAY1, int DIM1)
 *     (type* IN_ARRAY2, int DIM1, int DIM2)
 *
 * where "type" is any type supported by the numpy module, to be
 * called in python with an argument list of a single array (or any
 * python object that can be passed to the numpy.array constructor
 * to produce an arrayof te specified shape).  This can be applied to
 * a existing functions using the %apply directive:
 *
 *     %apply (double* IN_ARRAY1, int DIM1) {double* series, int length}
 *     %apply (double* IN_ARRAY2, int DIM1, int DIM2) {double* mx, int rows, int cols}
 *     double sum(double* series, int length);
 *     double max(double* mx, int rows, int cols);
 *
 * or with
 *
 *     double sum(double* IN_ARRAY1, int DIM1);
 *     double max(double* IN_ARRAY2, int DIM1, int DIM2);
 */

/* One dimensional input arrays */
%define TYPEMAP_IN1(r_type, r_cast, sg_type, error_string)
%typemap(in) (sg_type* IN_ARRAY1, INT DIM1) (SEXP rvec)
{
    rvec=$input;
    if (TYPEOF(rvec) != r_type)
    {
        /*SG_ERROR("Expected Double Vector as argument %d\n", m_rhs_counter);*/
        SWIG_fail;
    }

    $1 = (sg_type*) r_cast(rvec);
    $2 = LENGTH(rvec);
}
%typemap(freearg) (type* IN_ARRAY1, INT DIM1) {
}
%enddef

TYPEMAP_IN1(INTSXP, INTEGER, INT, "Integer")
TYPEMAP_IN1(REALSXP, REAL, DREAL, "Double Precision")
#undef TYPEMAP_IN1

%define TYPEMAP_IN2(r_type, r_cast, sg_type, error_string)
%typemap(in) (sg_type* IN_ARRAY2, INT DIM1, INT DIM2) (SEXP feat)
{
    feat=$input;
    if( TYPEOF(feat) != r_type)
    {
        /*SG_ERROR("Expected Double Matrix as argument %d\n", m_rhs_counter);*/
        SWIG_fail;
    }

    $1 = (sg_type*) r_cast(feat);
    $2 = Rf_nrows(feat);
    $3 = Rf_ncols(feat);
}
%typemap(freearg) (type* IN_ARRAY2, INT DIM1, INT DIM2) {
}
%enddef

TYPEMAP_IN2(INTSXP, INTEGER, INT, "Integer")
TYPEMAP_IN2(REALSXP, REAL, DREAL, "Double Precision")
#undef TYPEMAP_IN2

/* TYPEMAP_ARGOUT macros
 *
 * This family of typemaps allows output C arguments of the form
 *
 *     (type** ARGOUT_ARRAY)
 *
 * where "type" is any type supported by the numpy module, to be
 * called in python with an argument list of a single contiguous
 * numpy array.  This can be applied to an existing function using
 * the %apply directive:
 *
 *     %apply (DREAL** ARGOUT_ARRAY1, {(DREAL** series, INT* len)}
 *     %apply (DREAL** ARGOUT_ARRAY2, {(DREAL** matrix, INT* d1, INT* d2)}
 *
 * with
 *
 *     void sum(DREAL* series, INT* len);
 *     void sum(DREAL** series, INT* len);
 *     void sum(DREAL** matrix, INT* d1, INT* d2);
 *
 * where sum mallocs the array and assigns dimensions and the pointer
 *
 */
%define TYPEMAP_ARGOUT1(r_type, r_cast, sg_type, if_type, error_string)
%typemap(in, numinputs=0) (sg_type** ARGOUT1, INT* DIM1) {
    $1 = (sg_type**) malloc(sizeof(sg_type*));
    $2 = (INT*) malloc(sizeof(INT));
}

%typemap(argout) (sg_type** ARGOUT1, INT* DIM1) {
    sg_type* vec = *$1;
    INT len = *$2;

    Rf_protect( $result = Rf_allocVector(r_type, len) );

    for (INT i=0; i<len; i++)
        r_cast($result)[i]=(if_type) vec[i];

    Rf_unprotect(1);
    free(*$1); free($1); free($2);
}
%enddef

TYPEMAP_ARGOUT1(INTSXP, INTEGER, BYTE, int, "Byte")
TYPEMAP_ARGOUT1(INTSXP, INTEGER, INT, int, "Integer")
TYPEMAP_ARGOUT1(INTSXP, INTEGER, SHORT, int, "Short")
TYPEMAP_ARGOUT1(REALSXP, REAL, SHORTREAL, float, "Single Precision")
TYPEMAP_ARGOUT1(REALSXP, REAL, DREAL, double, "Double Precision")
TYPEMAP_ARGOUT1(INTSXP, INTEGER, WORD, int, "Word")
#undef TYPEMAP_ARGOUT1

%define TYPEMAP_ARGOUT2(r_type, r_cast, sg_type, if_type, error_string)
%typemap(in, numinputs=0) (sg_type** ARGOUT2, INT* DIM1, INT* DIM2) {
    $1 = (sg_type**) malloc(sizeof(sg_type*));
    $2 = (INT*) malloc(sizeof(INT));
    $3 = (INT*) malloc(sizeof(INT));
}

%typemap(argout) (sg_type** ARGOUT2, INT* DIM1, INT* DIM2) {
    sg_type* matrix = *$1;
    INT num_feat = *$2;
    INT num_vec = *$3;

    Rf_protect( $result = Rf_allocMatrix(r_type, num_feat, num_vec) );

    for (INT i=0; i<num_vec; i++)
    {
        for (INT j=0; j<num_feat; j++)
            r_cast($result)[i*num_feat+j]=(if_type) matrix[i*num_feat+j];
    }
    Rf_unprotect(1);
    free(*$1); free($1); free($2); free($3);
}
%enddef

TYPEMAP_ARGOUT2(INTSXP, INTEGER, BYTE, int, "Byte")
TYPEMAP_ARGOUT2(INTSXP, INTEGER, INT, int, "Integer")
TYPEMAP_ARGOUT2(INTSXP, INTEGER, SHORT, int, "Short")
TYPEMAP_ARGOUT2(REALSXP, REAL, SHORTREAL, float, "Single Precision")
TYPEMAP_ARGOUT2(REALSXP, REAL, DREAL, double, "Double Precision")
TYPEMAP_ARGOUT2(INTSXP, INTEGER, WORD, int, "Word")
#undef TYPEMAP_ARGOUT2