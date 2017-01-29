%function [locations] = locateChampByHealthbar(img)
% locateChampByHealthbar
% Finds a champion based on the health bar. Returns the location of the
% bounding box, based on upper left and lower right corners.

% Initialize for results
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);

locations = [0 0 0 0];
heroNum = 0;

% create mask based on health bar color
mask = zeros(size(red));
mask(blue > 200 & red < 100 & green < 100) = 1; % blue health bar
mask(green > 150 & red < 100 & blue < 100) = 1; % green health bar
mask(red > 200 & blue < 100 & green < 100) = 1; % red health bar
mask(blue < 15 & red < 15 & green < 15) = 1; % black/empty health bar

% Find rectangular regions
label = bwlabel(mask);

for i=1:max(max(label))
    pixels = zeros(size(label));
    pixels(label == i) = 1;
    numPixels = sum(sum(pixels));
    
    if (numPixels > 850 && numPixels < 950)
        % region is the right size for a health bar

        colNums = 1:1:size(pixels,2);
        rowNums = (1:1:size(pixels,1))';
        
        healthRows = sum(pixels,1);
        healthRows = rowNums(healthRows > 0);
        width = max(healthRows) - min(healthRows);
        
        healthCols = sum(pixels, 2);
        healthCols = colNums(healthCols > 0);
        height = max(healthCols) - min(healthCols);
        
        if (height < 15 & width < 150)
            % region has the right dimensions for a health bar
            
            heroNum = heroNum + 1;
            locations(heroNum,1) = min(healthCols);
            locations(heroNum,2) = min(healthRows);
            locations(heroNum,3) = max(healthCols);
            locations(heroNum,4) = max(healthRows);
        end
    end
    
end

%end

