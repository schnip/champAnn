function [locations] = locateChampByHealthbar(img)
% locateChampByHealthbar
% Finds a champion based on the health bar. Returns the location of the
% bounding box, based on upper left and lower right corners.

%size(img)
img = img(1:(size(img, 1) - 50), 1:size(img,2), :);

% Initialize for results
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

img_hsv = rgb2hsv(img);

hue = img_hsv(:,:,1);
sat = img_hsv(:,:,2);
val = img_hsv(:,:,3);

locations = [0 0 0 0];
heroNum = 0;

% create mask based on health bar color
mask = zeros(size(red));
mask(hue < 0.03 | hue > 0.98) = 1; % red health bar
mask(hue < 0.6 & hue > 0.5) = 1; % blue health bar
mask(hue < 0.36 & hue > 0.3) = 1; % green health bar
mask(blue < 15 & red < 15 & green < 15) = 1; % black/empty health bar

mask = imerode(mask,strel('square',4));
mask = imdilate(mask,strel('square',4));

% Find rectangular regions
label = bwlabel(mask);
max(max(label))
pixels = zeros(size(label));
%imshow(label);

for i=1:max(max(label))
    pixels(:,:) = 0;
    pixels(label == i) = 1;
    numPixels = sum(sum(pixels));
    
    if (numPixels > 1000 && numPixels < 2500)
        % region is the right size for a health bar
        %imshow(pixels);

        colNums = 1:1:size(pixels,2);
        rowNums = (1:1:size(pixels,1))';
        
        healthRows = sum(pixels,2);
        healthRows = rowNums(healthRows > 0);
        height = max(healthRows) - min(healthRows);
        
        healthCols = sum(pixels, 1);
        healthCols = colNums(healthCols > 0);
        width = max(healthCols) - min(healthCols);
        
        if (height < 25 && width < 150)
            % region has the right dimensions for a health bar
            heroNum = heroNum + 1;
            locations(heroNum,1) = min(healthRows) + 50;
            locations(heroNum,2) = min(healthCols) - 50;
            locations(heroNum,3) = max(healthRows) + 200;
            locations(heroNum,4) = max(healthCols) + 0;
        end
    end
    
end

end