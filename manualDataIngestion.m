ingestfolder = 'ingestfolder/';
postgestfolder = 'postgestfolder/';
infiles = dir(ingestfolder);
champs = textscan(fopen('champnames.txt'), '%s');
champs = champs{1};

for f = infiles'
	f.name
	PNG = strfind(f.name, 'PNG');
	png = strfind(f.name, 'png');
	JPG = strfind(f.name, 'JPG');
	jpg = strfind(f.name, 'jpg');
	num = size(PNG,1) + size(png,1) + size(JPG,1) + size(jpg,1);
	if num > 0
		img = readInImage(strcat(ingestfolder, f.name));
		boxes = locateChampByHealthbar(img)
		for i = 1:size(boxes,1)
			inimg = clip(img, boxes(i,:));
			imshow(inimg)
			s = listdlg('PromptString', 'Which champion is this?', 'ListString', champs);
			champname = champs{s}
			saveTrainImg(inimg, champname);
		end
		movefile(strcat(ingestfolder, f.name), postgestfolder);
	end
end