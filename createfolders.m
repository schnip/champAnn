% Small script to create all the folders needed, in case any of them are empty (which causes issues)

champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

for i = 1:size(champs,1)
	c = champs(i);
	c = c{1};
	mkdir(strcat('trainImages/', c));
    mkdir(strcat('allImages/', c));
    mkdir(strcat('testImages/', c));
    mkdir(strcat('featureset/', c));
end