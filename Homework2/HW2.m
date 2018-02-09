%% Homework 2, Problem 8
clear all;
close all;
clc;
%%
% If we keep running a low pass filter over the image eventually the effect
% of the low pass filter is minimal because all that remains are low
% freqencies. This is the limiting effect.

img = imread('ngc6543a.jpg');

lpf = fspecial('gaussian',3,1.7);

lpf_img = imfilter(img, lpf, 'replicate');

for i=1:1000
    lpf_img = imfilter(lpf_img, lpf, 'replicate');
end

figure;
subplot(1,2,1)
imshow(img);
title('Image before passes');

subplot(1,2,2);
imshow(lpf_img);
title('Image after 1000 LPF passes');
%% 
% This looks similar to after just 100 passes.
lpf_img = imfilter(img, lpf, 'replicate');

for i=1:100
    lpf_img = imfilter(lpf_img, lpf, 'replicate');
end

figure;
subplot(1,2,1)
imshow(img);
title('Image before passes');

subplot(1,2,2);
imshow(lpf_img);
title('Image after 100 LPF passes');
