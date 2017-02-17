clearvars
close all
clc

img = imread('testBlue.jpg');
imshow(img);

locations = locateChampByHealthbar(img);

