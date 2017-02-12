load('trainedNeural.mat');
load('featureset/aatrox/2.mat');
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

in = features(:);
y = net(in);

img = imread('test3.png');
locs = locateChampByHealthbar(img);
for i=1:size(locs, 1)
	loc = locs(i,:);
	clips = clip(img, loc);
	feat = featureDetect(clips);
	iam = net(feat(:));
	champs(find(max(iam) == iam))
end