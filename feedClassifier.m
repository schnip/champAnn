infolder = 'featureset/';
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};
data_in = [];
data_out = zeros(4,7*7*3);
index = 1;

for i = 1:size(champs,1)
	peep = champs{i};
	files = dir(strcat(infolder, peep));
	for j = 1:size(files,1)
		sample = files(j);
		if strfind(sample.name, '.mat')
			load(strcat(infolder, peep, '/', sample.name));
			data_in(index) = i;
			data_out(index,:) = features(:)';
			index = index + 1;
		end
	end
end

% make a neural net with 136 outputs, all that jazz, you'll remember how to do this in the morning
%net = network()