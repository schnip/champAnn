clearvars
close all
clc

img = imread('RedChampTest.jpg');
imshow(img);

locations = locateChampByHealthbar(img);

