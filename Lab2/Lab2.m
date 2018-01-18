%% Fun with sampling, registration, and quantization
%% Reset envrioment
clear all;
close all;
%% Read in images
sky_full_im = imread('sky.jpg');
bricks_full_im = imread('bricks.jpg');

%% Sampling and Resizing
% Here we resize the sky image with antialising off and on.
sky_128_aliased=imresize(sky_full_im, [128 128], 'Antialiasing',false);
sky_128 = imresize(sky_full_im, [128 128]);


%%
% Here we show the aliased  sky image
figure;
imshow(sky_128_aliased);
%%
% And now wae shoe the anti-aliased sky image
figure;
imshow(sky_128);
%%
% In the case of the above images it is hard to see the effects of aliasing
% on both images
%%
% Here we resize the bricks image with antialsing off and on.
bricks_128_aliased=imresize(bricks_full_im, [128 128], 'Antialiasing',false);
bricks_128 = imresize(bricks_full_im, [128 128]);
%%
% Here we show the aliased  sky image
figure;
imshow(bricks_128_aliased);
%%
% And now wae shoe the anti-aliased sky image
figure;
imshow(bricks_128);
%%
% With the above images we can see that with the antialising off we see
% aliasing in the bricks. Turning it on results in a better picture.