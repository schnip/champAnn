infolder = 'featureset/';
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};
feature_num = 7*7*3;
data_in = [];
data_out = zeros(4,feature_num);
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
%net = network(feature_num, 3, [1 1 1]', zeros(feature_num), zeros(feature_num), ones(1, size(champs, 1)));
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize);


% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

net.trainParam.showWindow = false;
net.trainParam.showCommandLine = false;

% Train the Network
[net,tr] = train(net,data_in,data_out');

save('trainedNeural.mat', 'net');