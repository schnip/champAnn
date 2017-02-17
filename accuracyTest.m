clearvars
close all
clc

% Load the neural net and the champion names
load('trainedNeural.mat');
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

% Generates confusion matrix for neural net.
confusion = zeros(size(champs,1));

testFolder = 'testImages/';
fileList = dir(testFolder);

totalCorrect = 0;
totalTested = 0;

for i=3:size(fileList)
    currFolder = strcat(fileList(i).name, '/');
    subdir = dir(strcat(testFolder, currFolder));
    for j = 3:size(subdir)
        % Test each image in the test folder
        img = imread(strcat(testFolder, currFolder, subdir(j).name));
        feat = featureDetect(img);
        iam = net(feat(:));
        cn = champs(max(iam) == iam)
        confusion(i-2, max(iam) == iam) = confusion(max(iam) == iam) + 1;
        totalTested = totalTested + 1;
        if (i-2 == find(iam == max(iam)))
            totalCorrect = totalCorrect + 1;
        end
    end
end

