function [ret] = doCurrentFeatureDetect(varargin)

if (nargin > 1)
	img = imread('0.png');
	sample = doCurrentFeatureDetect(img);
	ret = size(sample(:), 1);
	return;
end

img = varargin{1};
%ret = featureDetect(img);
ret = kmeans(img);