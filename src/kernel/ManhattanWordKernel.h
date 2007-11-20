/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Written (W) 1999-2007 Soeren Sonnenburg
 * Copyright (C) 1999-2007 Fraunhofer Institute FIRST and Max-Planck-Society
 */

#ifndef _MANHATTENWORDKERNEL_H___
#define _MANHATTENWORDKERNEL_H___

#include "lib/common.h"
#include "kernel/SimpleKernel.h"
#include "features/WordFeatures.h"

class CManhattanWordKernel: public CSimpleKernel<WORD>
{
public:
	CManhattanWordKernel(INT size, DREAL width);
	CManhattanWordKernel(CWordFeatures* l, CWordFeatures* r, DREAL width);
	virtual ~CManhattanWordKernel();
	
	virtual bool init(CFeatures* l, CFeatures* r);
	virtual void cleanup();

	/// load and save kernel init_data
	bool load_init(FILE* src);
	bool save_init(FILE* dest);

	// return what type of kernel we are Linear,Polynomial, Gaussian,...
	virtual EKernelType get_kernel_type() { return K_MANHATTANWORD; }

	// return the name of a kernel
	virtual const CHAR* get_name() { return "ManhattanWord"; }

	void get_dictionary(INT& dsize, DREAL*& dweights) 
	{
		dsize=dictionary_size;
		dweights = dictionary_weights;
	}

protected:
	/// compute kernel function for features a and b
	/// idx_{a,b} denote the index of the feature vectors
	/// in the corresponding feature object
	DREAL compute(INT idx_a, INT idx_b);

protected:
	INT dictionary_size;
	DREAL* dictionary_weights;
	DREAL width;
};

#endif /* _MANHATTENWORDKERNEL_H__ */