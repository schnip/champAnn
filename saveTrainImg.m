function saveTrainImg(img, champname)
% This function saves an image to a given champion's image folder, giving it a name that won't conflict

foldpath = 'trainingimg/';
foldpath = strcat(foldpath, champname);
foldpath = strcat(foldpath, '/');
infopath = strcat(foldpath, 'info.mat');
num = 0

if exist(infopath, 'file') == 2
	load(infopath);
end

while exist(strcat(foldpath, num2str(num), '.png')) == 2
	num = num + 1;
end

imwrite(img, strcat(foldpath, num2str(num), '.png'));

num = num + 1;

save(infopath, 'num');
