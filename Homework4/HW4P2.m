%% Problem 1
clear all;
close all;
%%
% Load the Camera man image
img = imread('cameraman.tif');
figure;
imshow(img);
title('Original Image');
%%
% Calulate its FFT
img_fft = log(abs(fftshift(fft2(im2double(img)))));
figure;
imagesc(img_fft);
title('FFT of the Original Image');
%%
% Add in gausian noise
img_n = imnoise(img, 'gaussian', 0,0.1);
figure;
imshow(img_n);
title('Original Image with noise')

img_n_fft = log(abs(fftshift(fft2(im2double(img_n)))));
figure;
imagesc(img_n_fft);
title('FFT of noise image')
%%
% Diag Sine
% Generate the sine image
normal_sin = repmat(sin(linspace(0,400*2*pi+pi,2000)),[2000 1]);
diag_sin = imrotate(normal_sin, 45);
diag_sin = imcrop(diag_sin, [800 800 255 255]);
% Add it in
img_ds = imfuse(img,diag_sin,'blend');
figure;
imshow(img_ds);
title('Original Image with Diag Sine');
img_ds_fft = log(abs(fftshift(fft2(im2double(img_ds)))));
figure;
imagesc(img_ds_fft);
title('FFT of Original Image with Diag Sine');
%%
% Add Horizontal and Vertical Sine Waves
vert_sin = repmat(sin(linspace(0,400*2*pi+pi,2000)),[2000 1]);
horz_sin = imrotate(vert_sin, 90);
horz_sin = imcrop(horz_sin, [800 800 255 255]);
vert_sin = imcrop(vert_sin, [800 800 255 255]);
% Add in the images
img_ch = imfuse(img,vert_sin,'blend');
img_ch = imfuse(img_ch,horz_sin,'blend');

figure;
imshow(img_ch);
title('Original Image with Horizontal and Vertical Sine');
img_ch_fft = log(abs(fftshift(fft2(im2double(img_ch)))));
figure;
imagesc(img_ch_fft);
title('FFT of Original Image with Horizontal and Vertical Sine');
%%
% Diag Filter
kernel = (.1)*eye(7);
img_df = imfilter(img, kernel);

figure;
imshow(img_df);
title('Original Image with Diag Filter Sine');
img_df_fft = log(abs(fftshift(fft2(im2double(img_df)))));
figure;
imagesc(img_df_fft);
title('FFT of Original Image with Diag filter Sine');
%%
% Noisy Image with Diag Filter
img_df_n = imfilter(img_n, kernel);

figure;
imshow(img_df_n);
title('Original Image with Diag Filter Sine');
img_df_n_fft = log(abs(fftshift(fft2(im2double(img_df_n)))));
figure;
imagesc(img_df_n_fft);
title('FFT of Original Image with Diag filter Sine');
%%
% Part B
h1 = [0 0 0;-1 0 1;0 0 0];
h2 = [-1 -2 -1; 0 0 0; 1 2 1];

h1_1 = [0 1 0];
h1_2 = [-1 0 1];

h2_1 = [-1 0 1];
h2_2 = [1 2 1];

w = -5:5;

H1 = [];
H1_1 = [];
H1_2 = [];
H2 = [];
H2_1 = [];
H2_2 = [];

for i = 1:length(w)
    for j = 1:length(w)
        H1(i,j) = dsft_2(h1,w(i),w(j));
        H1_1(i,j) = dsft_1(h1_1,w(i));
        H1_2(i,j) = dsft_1(h1_2,w(j));
        
        H2(i,j) = dsft_2(h2,w(i),w(j));
        H2_1(i,j) = dsft_1(h2_1,w(i));
        H2_2(i,j) = dsft_1(h2_2,w(j));
    end
end
figure;
imagesc(real(H1));
title('Real part of H1')
figure;
imagesc(imag(H1));
title('Imag part of H1')
figure;
imagesc(real(H2));
title('Real part of H2')
figure;
imagesc(imag(H2));
title('Imag part of H2')

H1_ = H1_1 * H1_2
H2_ = H2_1 * H2_2

figure;
imagesc(real(H1_));
title('Real part of H1 with 2 1D DSFT')
figure;
imagesc(imag(H1_));
title('Imag part of H1 with 2 1D DSFT')
figure;
imagesc(real(H2_));
title('Real part of H2 with 2 1D DSFT')
figure;
imagesc(imag(H2_));
title('Imag part of H2 with 2 1D DSFT')
% They recombined to give us a similar products.

img_w_h1 = imfilter(img_n,h1);
img_w_h2 = imfilter(img_n,h2);

figure;
imshow(img_w_h1);
title('Filtered Image with H1');
figure;
imshow(img_w_h2);
title('Filtered Image with H2');
%% Problem 2
c = 1/sqrt(2);
h1 = [1 1 0 0;
      0 0 1 1;
      1 -1 0 0;
      0 0 1 -1];
h2 = [c c c c;
      c c -c -c;
      1 -1 0 0;
      0 0 1 -1];
h1 = c * h1;
h2 = c * h2;


for i = 1:2:4
   for j = 1:4
      figure;
      imagesc(h1(i,:)'*h2(:,j)');
   end
end

