function saveTrainImg(img, champname)

foldpath = 'trainingset/';
foldpath = strcat(foldpath, champname);
foldpath = strcat(foldpath, '/');
infopath = strcat(foldpath, 'info.mat');
num = 0

if exist(infopath, 'file') == 2
	load(infopath);
end

while exist(strcat(foldpath, char(num), '.png')) == 2
	num = num + 1;
end

imwrite(img, strcat(foldpath, char(num), '.png'));

num = num + 1;

save(infopath, 'num');
