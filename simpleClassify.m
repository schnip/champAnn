load('trainedNeural.mat');
load('featureset/aatrox/2.mat');

in = features(:);
y = net(in');