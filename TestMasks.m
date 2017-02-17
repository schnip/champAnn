% TestMasks
% Tests thresholds to find the right values for masks.

img = imread('test4.jpg');

img = img(1:(size(img, 1) - 50), 1:size(img,2), :);

% Initialize for results
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

img_hsv = rgb2hsv(img);

hue = img_hsv(:,:,1);
sat = img_hsv(:,:,2);
val = img_hsv(:,:,3);

% create mask based on health bar color
mask = zeros(size(red));
mask(hue < 0.05 | hue > 0.98) = 1; % red health bar
mask(hue < 0.6 & hue > 0.5) = 1; % blue health bar
mask(hue < 0.36 & hue > 0.3) = 1; % green health bar

mask(val < 0.6) = 0;    % eliminate dim regions
mask(val < 0.4 & sat > 0.7) = 1;
mask(blue < 15 & red < 15 & green < 15) = 1; % black/empty health bar

mask = imerode(mask,strel('square',4));
mask = imdilate(mask,strel('square',4));
mask = imdilate(mask,strel('square',4));
mask = imerode(mask,strel('square',4));

% Find rectangular regions
label = bwlabel(mask);
max(max(label));
pixels = zeros(size(label));
imshow(label);
% imtool(img_hsv);
imtool(img);

% Start displaying certain hsv bands
% figure(2);
% imshow(sat);
% figure(3);
% imshow(val);
