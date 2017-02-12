clc
clearvars
close all


trainFolder = 'trainingimg/';
testFolder = 'testImages/';
fileList = dir(trainFolder);

numImagesMoved = 4;

for i = 3:size(fileList)
    currFolder = strcat(fileList(i).name, '/');
    subdir = dir(strcat(trainFolder, currFolder));
    numImagesMoved = min(4, size(subdir)-2);
    for i = 3:numImagesMoved+2
        fromFold = strcat(trainFolder, currFolder, subdir(i).name);
        toFold = strcat(testFolder, currFolder);
        copyfile(fromFold, toFold);
    end
end
