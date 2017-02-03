infolder = 'trainingimg/';
outfolder = 'featureset/';
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

for i = 1:size(champs,1)
	peep = champs{i};
	files = dir(strcat(infolder, peep));
	for j = 1:size(files,1)
		sample = files(j);
		if strfind(sample.name, '.png')
			outname = strcat(outfolder, peep, '/', strrep(sample.name, 'png', 'mat'));
			img = imread(strcat(infolder, peep, '/', sample.name));
			features = featureDetect(img);
			save(outname, 'features');
		end
	end
end