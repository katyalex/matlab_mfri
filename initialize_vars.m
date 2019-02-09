
function [b] = initialize_vars(subjects,i)

% SPM info
b.spmDir = fileparts(which('spm'));         % path to SPM installation

% Directory information
dataDir = 'E:\2015 MRI\';
b.curSubj = subjects{i};
b.dataDir = strcat(dataDir,b.curSubj,'/');  % make data directory subject-specific
b.funcRuns = {'preprocess(file frame)\Resting EPI1\' 'preprocess(file frame)\Resting EPI2\'};       % folders containing functional images
b.anatT1 = 'preprocess(file frame)\T1MPRAGE';                        % folder containing T1 structural

% Call sub-function to run exceptions
b = run_exceptions(b);

end


% Subject-specific exceptions (e.g., deviations from naming convention)
function b = run_exceptions(b)

if strcmp(b.curSubj,'01')
    if isfield(b,'funcRuns')
        b.funcRuns = {'epi_0002' 'epi_0003'}; % e.g., if s01 had different run numbers
    end
end

end