load('trainedNeural.mat');
load('featureset/aatrox/2.mat');
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

in = features(:);
y = net(in);

img = imread('test3.png');
locs = locateChampByHealthbar(img)
clips = clip(img, locs);
feat = featureDetect(clips);
iam = net(feat(:));
champs(find(max(iam) == iam))