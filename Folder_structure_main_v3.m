% Folder_structure_main_v3.m--
% Developed in Matlab 9.7.0.1190202 (R2019b) on PCWIN64
% Copyright Sheffield Teaching Hospitals NHS Foundation Trust 16-03-2023.
% Lloyd Clayburn (lloyd.clayburn@nhs.net), 
%-------------------------------------------------------------------------

% Instructions: Export all DICOM data to year folders, then run script to auto-edit folder structure
% Further work: open DICOM headers to find out where to put files from a central dir - query robustness

% v2: fixed bug in Folder_structure, renamed as Folder_structure_v2
% v3: folder names 10, 11, 12, instead of 010, 011, 012

% R:\Ultrasound\_STH\JWH\Scan Dept
% main_path='\\sth.nhs.uk\user\Documents\038\ClayburnL\Y2\2.US\Automate monthly QA\Test2\';
main_path='R:\Ultrasound\_STH\JWH\Scan_Dept\_Monthly\';
cd(main_path);
folders=dir('*.*');

for i=3:(length(folders)-2)
        path=strcat(main_path,folders(i).name);
        path=strcat(path,'\');
        cd(path);
        subfolders=dir('*.*');
        % catch exception folder with an extra file for some reason
        if i==7
            path=strcat(path,subfolders(end-2).name);
        else
            path=strcat(path,subfolders(end-1).name);
        end
        path=strcat(path,'\');
        Folder_structure_v3(path);
end
