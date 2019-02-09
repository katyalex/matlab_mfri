# matlab_fmri
Full pipeline for preprocessing. 
This is a code to perform pre-processing step for analysing MRI, taken and slightly supplemented from https://github.com/ritcheym/fmri_misc/tree/master/batch_system. It includes:
1. Initialize vars code, which create path to files. 
2. spm_preproc1 code, which contains code to looping over multiple subjects and jobs in spm. 
3. Functions for performing slice time correction, realign & unwrap, segmentation, co-registration, normalization and smoothing of images. 
