function [ret] = readInImage(varargin)
	
	imgfile = varargin{1};

	ret = imread(imgfile);