clearvars
close all
clc

img = imread('test.png');
imshow(img);

locations = locateChampByHealthbar(img);

