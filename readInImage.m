function [ret] = readInImage(varargin)
	% Loads the image, this was in case anything weird started to be needed to be done in this spot
	
	imgfile = varargin{1};

	ret = imread(imgfile);