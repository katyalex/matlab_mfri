function [matlabbatch] = job_smooth(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^wuaf';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^wuaf';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.spm.spatial.smooth.data(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^wuaf)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.smooth.data(2) = cfg_dep('File Selector (Batch Mode): Selected Files (^wuaf)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{3}.spm.spatial.smooth.dtype = 0;
matlabbatch{3}.spm.spatial.smooth.im = 0;
matlabbatch{3}.spm.spatial.smooth.prefix = 's';

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end