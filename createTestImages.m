clc
clearvars
close all


trainFolder = 'trainingimg/';
testFolder = 'testImages/';
fileList = dir(trainFolder);

maxImagesMoved = 4;

for i = 3:size(fileList)
    currFolder = strcat(fileList(i).name, '/');
    subdir = dir(strcat(trainFolder, currFolder));
    numImagesMoved = min(maxImagesMoved, size(subdir)-2);
    for j = 3:numImagesMoved+2
        fromFold = strcat(trainFolder, currFolder, subdir(j).name);
        toFold = strcat(testFolder, currFolder);
        copyfile(fromFold, toFold);
    end
end
