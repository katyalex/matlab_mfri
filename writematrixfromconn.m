wdir 		= 'E:\2015 MRI\conn_test2\results\secondlevel';
corr_net 	= 'SBC_01';
corr_group 	= 'AllSubjects';
corr_run 	= 'rest';
corr_folder = [ wdir '/' corr_net '/' corr_group '/' corr_run '/' ];
numROI  	= size(ROI, 2);
corr_name 	= ROI(1).names(1:numROI);

corr_h   	= [];   % Beta value
corr_F  	= [];   % Statistic value
corr_p   	= [];   % One-tailed p value

for i = 1:numROI
	corr_h = [ corr_h ; ROI(i).h(1:numROI) ];
	corr_F = [ corr_F ; ROI(i).F(1:numROI) ];
	corr_p = [ corr_p ; ROI(i).p(1:numROI) ];
end

% array2table does not work with '-' in var names
corr_name2 = strrep(corr_name, '-', '_');
corr_name2 = strrep(corr_name2, '.', '');
corr_name2 = strrep(corr_name2, ',', '');
corr_name2 = strrep(corr_name2, ' ','');
corr_name2 = strrep(corr_name2, ')', '');
corr_name2 = strrep(corr_name2, '(', '');
corr_name2 = strrep(corr_name2, 'atlas','');
corr_name2 = strrep(corr_name2, 'networks','');
corr_name2{1,51} = 'SMAleft';
corr_name2{1,50} = 'SMAright';
corr_name2{1,84} = 'HGrHeschlsGyrusRight';
corr_name2{1,85} = 'HGrHeschlsGyrusLeft';
T_h        	= array2table(corr_h, 'RowNames', corr_name2, 'VariableNames', corr_name2);
T_F        	= array2table(corr_F, 'RowNames', corr_name2, 'VariableNames', corr_name2);
T_p        	= array2table(corr_p, 'RowNames', corr_name2, 'VariableNames', corr_name2);

filename = 'patientdata.xlsx';
%writetable(T,filename,'Sheet',1,'Range','D1')

writetable( T_h, [corr_folder 'beta_' corr_net '_' corr_group '_' corr_run '.xls'], 'WriteVariableNames', true, 'WriteRowNames', true );
writetable( T_F, [corr_folder 'F_' corr_net '_' corr_group '_' corr_run '.xls'], 'WriteVariableNames', true, 'WriteRowNames', true);
writetable( T_p, [corr_folder 'p_' corr_net '_' corr_group '_' corr_run '.xls'], 'WriteVariableNames', true, 'WriteRowNames', true);
