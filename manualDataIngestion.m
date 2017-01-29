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
		boxes = locateChampByHealthbar(img);
		
	end
end