% Folder_structure_v2.m--
% Developed in Matlab 9.7.0.1190202 (R2019b) on PCWIN64
% Copyright Sheffield Teaching Hospitals NHS Foundation Trust 13-03-2023.
% Lloyd Clayburn (lloyd.clayburn@nhs.net), 
%-------------------------------------------------------------------------

% Inputs: path - directory containing freshly exported data
% v2: fixed bug

function [] = Folder_structure(path)

    mainpath=path;
    cd(path);
    folders=dir('*.*');

    % Create new folder for month
    month=length(folders)-2;
    month=strcat('0',num2str(month));
    mkdir(month);
    month=strcat(month,'\');
    newpath=strcat(path,month);

    % Find new data
    folders=dir('*.*');
    oldpath=strcat(path,folders(end).name);
    oldpath=strcat(oldpath,'\');
    cd(oldpath);
    subfolders=dir('*.*');
    path=oldpath;
    for j=1:3
        path=strcat(path,subfolders(3).name);
        path=strcat(path,'\');
        cd(path);
        subfolders=dir('*.*');
    end

    % Move DICOM data to new folder
    movefile('*.*', newpath);
    cd(mainpath);

    % Delete unused data
    check=oldpath(end-28:end-23); % Should this be 27 and 22?
    if strcmp(check,'Export')
        rmdir(oldpath,'s'); % be careful with this!
    end
end