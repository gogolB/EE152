%% Reset the Program
clear all;
close all;

%% Load the image
% Here I am going to read in the image and store it in a variable _img_
img = imread('gogol.jpg');

%% Display the image
% Show the image with |imshow()|
imshow(img)

%%
% Now I am going to use |image()|
image(img)

%%
% Finally I am going to use |imagesc()|
imagesc(img)

%% Resizing the Image
resized_img = imresize(img, [256 256]);
image(resized_img);

%% Cropping face image

%% Replacing Face Region with colored boxes

%% Resize face image

%% Save Resized face image

%% Histograms of full image

%% Histograms of face image