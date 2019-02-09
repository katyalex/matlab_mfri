function [matlabbatch] = job_stc(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^f';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^f';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.spm.temporal.st.scans{1}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^f)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.temporal.st.scans{2}(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^f)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.temporal.st.nslices = 30;
matlabbatch{3}.spm.temporal.st.tr = 2;
matlabbatch{3}.spm.temporal.st.ta = 1.93333333333333;
matlabbatch{3}.spm.temporal.st.so = [2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 1 3 5 7 9 11 13 15 17 19 21 23 25 27 29];
matlabbatch{3}.spm.temporal.st.refslice = 2;
matlabbatch{3}.spm.temporal.st.prefix = 'a';

spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end