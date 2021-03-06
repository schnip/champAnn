% This script takes all the images from the ingestfolder, then detects and clips, then prompts the user to whom the character is, then is saved in the correct folder

close all
clear all

ingestfolder = 'ingestfolder/';
postgestfolder = 'postgestfolder/';
infiles = dir(ingestfolder);
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};
s = 1;
fig = figure;
fig.Position = [200 200 200 200];

for f = infiles'
	f.name
	PNG = strfind(f.name, 'PNG');
	png = strfind(f.name, 'png');
	JPG = strfind(f.name, 'JPG');
	jpg = strfind(f.name, 'jpg');
	num = size(PNG,1) + size(png,1) + size(JPG,1) + size(jpg,1);
	if num > 0
		img = readInImage(strcat(ingestfolder, f.name));
		boxes = locateChampByHealthbar(img, 0)
		for i = 1:9:size(boxes,1)
			inimg = clip(img, boxes(i,:));
			imshow(inimg)
			s = listdlg('PromptString', 'Which champion is this?', 'InitialValue', s, 'ListString', champs);
			champname = champs{s}
            inimg = clip(img, boxes(i,:));
            saveTrainImg(inimg, champname);
            for j = 1:8
                inimg = clip(img, boxes(i+j,:));
                saveTrainImg(inimg, champname);
            end
		end
		movefile(strcat(ingestfolder, f.name), postgestfolder);
	end
end