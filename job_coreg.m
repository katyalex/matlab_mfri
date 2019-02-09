function [matlabbatch] = job_coreg(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.anatT1]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 'brain';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^meanuaf';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^uaf';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^uaf';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{5}.spm.spatial.coreg.estimate.ref(1) = cfg_dep('File Selector (Batch Mode): Selected Files (brain)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.coreg.estimate.source(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^meanuaf)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.coreg.estimate.other(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^uaf)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.coreg.estimate.other(2) = cfg_dep('File Selector (Batch Mode): Selected Files (^uaf)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{4}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end