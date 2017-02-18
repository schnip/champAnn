% This script separates the training images in to a folder that has training images that doesn't have the test images in there, and then also a test folder.

clearvars
close all

sourceFolder = 'allImages/';
testFolder = 'testImages/';
trainFolder = 'trainImages/';
fileList = dir(sourceFolder);

maxTestImages = 4;

for i = 3:size(fileList)
    currFolder = strcat(fileList(i).name, '/')
    subdir = dir(strcat(sourceFolder, currFolder));
    for j = 3:size(subdir)
        fromFold = strcat(sourceFolder, currFolder, subdir(j).name);
        if (j < 3 + maxTestImages)
            toFold = strcat(testFolder, currFolder);
        else
            toFold = strcat(trainFolder, currFolder);
        end
        copyfile(fromFold, toFold);
    end
end
