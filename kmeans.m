function [ret] = kmeans(img)
% This is a kmeans feature detection, but was butured to just have the remove background and then run the other feature detection on that result
%global rows col k red green blue

% read in image, then resize to 8x8

%image = imread('12.png');
image = img;
[rows, col] = size(img);

% img = imresize(image,1/10);
mask = ones(rows,col);

img = double(image)/255;
red = img(:,:,1);
green = img(:,:,2);
blue = img(:,:,3);
%figure(1)
%imshow(im2uint8(img))
imgMask = find(img(:,:,1) < 0.4706 & img(:,:,2) < 0.4706 & img(:,:,3) < 0.4706);

red(imgMask)=0;
green(imgMask)=0;
blue(imgMask)=0;

img=cat(3,red,green,blue);
%figure(2)
%imshow(im2uint8(img));

ret = featureDetect(img);
return;

ret = tall/kmeans(img,4);
return;


% Assigning means

k = 4;
means = [0 0 0;1 0 0;0 1 0;0 0 1]; % creates a 4-by-3 matrix of numbers for black, red, green, and blue

distances = zeros(k,1);
classes = zeros(rows,col);


[rows,col,trash] = size(img);

counter = 0;
while(counter<8)
    [means, classes, distances] = iterativeDistance(means, classes, img, distances, rows, col, k, red, green, blue);
    counter = counter+1;
end

ret = means;
return;

%figure(1)
%imshow(img);

outputImage = zeros(rows,col,3);

for o = 1:rows
    for p = 1:col
        for n = 1:k
            if (classes(o,p) == n)
                outputImage(o,p,:) = means(n,:);
            end
        end
    end
end

%figure(2)
imshow(outputImage);

