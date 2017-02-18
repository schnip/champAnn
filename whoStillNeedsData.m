% Looks to see who we still don't have any training data

infolder = 'trainingimg/';
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};
samples = [0];

for i = 1:size(champs,1)
	peep = champs{i};
	files = dir(strcat(infolder, peep));
	samples(i) = size(files,1);
end
samples;
champs{find(samples < 5)}
