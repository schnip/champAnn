clearvars
close all
clc

img = imread('Test_Image_2.png');
imshow(img);

locations = locateChampByHealthbar(img);

