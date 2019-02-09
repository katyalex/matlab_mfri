function [matlabbatch] = job_norm_str(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.anatT1]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^brain';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.anatT1]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^y';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^y)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^brain)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{3}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
matlabbatch{3}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{3}.spm.spatial.normalise.write.woptions.prefix = 'w';
spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end