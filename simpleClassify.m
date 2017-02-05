load('trainedNeural.mat');
load('featureset/aatrox/2.mat');

in = features(:);
y = net(in);

img = imread('test.png');
locs = locateChampByHealthbar(img)
locs = featureDetect(img);