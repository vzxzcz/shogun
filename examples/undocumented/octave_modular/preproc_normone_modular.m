init_shogun

addpath('tools');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');

%NormOne
disp('NormOne')

feats_train=RealFeatures(fm_train_real);
feats_test=RealFeatures(fm_test_real);

preproc=NormOne();
preproc.init(feats_train);
feats_train.add_preproc(preproc);
feats_train.apply_preproc();
feats_test.add_preproc(preproc);
feats_test.apply_preproc();

width=1.4;
size_cache=10;

kernel=Chi2Kernel(feats_train, feats_train, width, size_cache);

km_train=kernel.get_kernel_matrix();
kernel.init(feats_train, feats_test);
km_test=kernel.get_kernel_matrix();
