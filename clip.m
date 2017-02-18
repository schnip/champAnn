function [smimg] = clip(img, vec4)
% This funciton takes an image and the coordinates of the bounding box and returns the image clipped to the size given in the bounding box

smimg = img(vec4(1):vec4(3), vec4(2):vec4(4), :);
%smimg = img(vec4(2):vec4(4), vec4(1):vec4(3));
