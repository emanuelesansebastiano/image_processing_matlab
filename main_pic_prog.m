%------------------------------------------------------------------------%
%main_pic_prog.m - main program to test image processing functions
%
% Author, date:
%   -Emanuele Sansebastiano, October 2017
%........................................................................%
%
% Input data:
%   - Image contained in the same folder
%      
% Output:
%   - Processed image
%
% Comments:
%   - To import a picture:      img = imread('name_picture.jpg'); 
%   - To see a picture:     imshow(img);
%   - A picture is basically a matrix:      pixY x pixX x 3 (RGB)
%   - To convert to grayscale:      Gimg = rgb2gray(img);
%   
%------------------------------------------------------------------------%

%% Clear previous data
clear all;

%% input
img = imread('nova_rob_logo.jpg');
figure(1);
imshow(img);

%% grayscale conversion
gimg = rgb2gray(img);
figure(2);
imshow(gimg);

%% Contour finder
cont_out = contour_finder_2D(img,1);
figure(3);
imshow(cont_out);













