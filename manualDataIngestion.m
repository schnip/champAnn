ingestfolder = 'ingestfolder/';
infiles = dir(ingestfolder);

for f = infiles'
	f.name
	PNG = strfind(f.name, 'PNG');
	png = strfind(f.name, 'png');
	JPG = strfind(f.name, 'JPG');
	jpg = strfind(f.name, 'jpg');
	if PNG | png | JPG | jpg
		img = readInImage(strcat(ingestfolder, f.name));
		boxes = locateChampByHealthbar(img)
		for i = 1:size(boxes,1)
			inimg = clip(img, boxes(i,:));
			imshow(inimg)
		end
	end
end