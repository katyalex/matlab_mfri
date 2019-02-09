function [matlabbatch] = job_norm(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.anatT1]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^y';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^uaf';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^meanuaf';
matlabbatch{3}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^uaf';
matlabbatch{4}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{5}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^y)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^uaf)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(2) = cfg_dep('File Selector (Batch Mode): Selected Files (^meanuaf)', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.normalise.write.subj.resample(3) = cfg_dep('File Selector (Batch Mode): Selected Files (^uaf)', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{5}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{5}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{5}.spm.spatial.normalise.write.woptions.prefix = 'w';
spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end