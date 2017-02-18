function [ret] = featureDetect(img)
	% This function is basically just the feature detection from the sunset project earlier in the quarter
	% It is an average on a $split by $split grid, across all three of the RGB dimensions
	split = 7;
	ret = zeros(split, split, 3);
	xlen = size(img, 1) / split - 1;
	xlen = int32(xlen);
	ylen = size(img, 2) / split - 1;
	ylen = int32(ylen);
	for i=1:split
		for j=1:split
			part = img((i-1) * xlen + 1:i*xlen, (j-1) * ylen + 1:j*ylen, :);
			ret(i,j,:) = mean(mean(part, 1), 2);
			%replace = ones(size(part));
			%replace(:,:,1) = ret(i,j,1) * replace(:,:,1);
			%replace(:,:,2) = ret(i,j,2) * replace(:,:,2);
			%replace(:,:,3) = ret(i,j,3) * replace(:,:,3);
			%img((i-1) * xlen + 1:i*xlen, (j-1) * ylen + 1:j*ylen, :) = replace;
		end
	end
	ret = ret / 256;

%     figure;
%     imshow(img);
end