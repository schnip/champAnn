function [smimg] = clip(img, vec4)

smimg = img(vec4(1):vec4(3), vec4(2):vec4(4));
