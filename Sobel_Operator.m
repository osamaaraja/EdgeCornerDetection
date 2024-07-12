% Initialization
close all;
clear all;
clc;

% Read and display the input image
image1 = imread('grocery.jpg');
imshow(image1);
title('Original Image');

% Convert the image to grayscale
Img = rgb2gray(image1); % converting the rgb image to a gray level image
Img = im2double(Img);

% Define the Sobel filters for x and y directions
sobel_x = [-1 0 1; -2 0 2; -1 0 1]; 
sobel_y = [1 2 1; 0 0 0; -1 -2 -1];

% Apply the Sobel filters to get gradients
grad_x = conv2(Img, sobel_x, 'same');
grad_y = conv2(Img, sobel_y, 'same');

% Compute the gradient magnitude
grad_magnitude = sqrt(grad_x.^2 + grad_y.^2);

% Display the gradients and the gradient magnitude
figure;
subplot(1, 3, 1);
imshow(grad_x, []);
title('Gradient in X direction');

subplot(1, 3, 2);
imshow(grad_y, []);
title('Gradient in Y direction');

subplot(1, 3, 3);
imshow(grad_magnitude, []);
title('Gradient Magnitude');
