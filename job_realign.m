function [matlabbatch] = job_realign(b)

matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{1}]};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^af';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {[b.dataDir b.funcRuns{2}]};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = '^af';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.spm.spatial.realignunwarp.data(1).scans(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^af)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.realignunwarp.data(1).pmscan = '';
matlabbatch{3}.spm.spatial.realignunwarp.data(2).scans(1) = cfg_dep('File Selector (Batch Mode): Selected Files (^af)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.spatial.realignunwarp.data(2).pmscan = '';
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.quality = 0.9;
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.sep = 4;
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.fwhm = 5;
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.rtm = 0;
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.einterp = 2;
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.ewrap = [0 0 0];
matlabbatch{3}.spm.spatial.realignunwarp.eoptions.weight = '';
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.basfcn = [12 12];
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.regorder = 1;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.lambda = 100000;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.jm = 0;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.fot = [4 5];
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.sot = [];
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.uwfwhm = 4;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.rem = 1;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.noi = 5;
matlabbatch{3}.spm.spatial.realignunwarp.uweoptions.expround = 'Average';
matlabbatch{3}.spm.spatial.realignunwarp.uwroptions.uwwhich = [2 1];
matlabbatch{3}.spm.spatial.realignunwarp.uwroptions.rinterp = 4;
matlabbatch{3}.spm.spatial.realignunwarp.uwroptions.wrap = [0 0 0];
matlabbatch{3}.spm.spatial.realignunwarp.uwroptions.mask = 1;
matlabbatch{3}.spm.spatial.realignunwarp.uwroptions.prefix = 'u';
spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch);

end
