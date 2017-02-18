function [ret] = doCurrentFeatureDetect(varargin)
% This function just runs whichever feature dection is the current one, when given any second argument just returns the size of whatever the output of the current feature detection is (mostly for getting the size of the input in to the neural net)

if (nargin > 1)
	img = imread('0.png');
	sample = doCurrentFeatureDetect(img);
	ret = size(sample(:), 1);
	return;
end

img = varargin{1};
ret = featureDetect(img);
%ret = kmeans(img);