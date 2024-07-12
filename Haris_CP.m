clc;
clear all;
close all;

% Read and preprocess the image
I = imread('grocery.jpg');
I = rgb2gray(I);
I = im2double(I);
imshow(I);

% Define the gradient filters
x_Gradient_filter = [-1 0 1; -2 0 2; -1 0 1];
y_Gradient_filter = [1 2 1; 0 0 0; -1 -2 -1];

% Compute the image gradients
x_Gradient = conv2(I, x_Gradient_filter, 'same');
y_Gradient = conv2(I, y_Gradient_filter, 'same');

% Define and normalize the Gaussian filter
Gaussian_weight = [2 4 5 4 2; 4 9 12 9 4; 5 12 15 12 5; 4 9 12 9 4; 2 4 5 4 2];
Gaussian_weight = Gaussian_weight / sum(Gaussian_weight(:));

% Compute the products of derivatives at each pixel
Ix2 = conv2(x_Gradient.^2, Gaussian_weight, 'same');
Iy2 = conv2(y_Gradient.^2, Gaussian_weight, 'same');
Ixy = conv2(x_Gradient .* y_Gradient, Gaussian_weight, 'same');

% Initialize the response matrix R
[r, c] = size(I);
R = zeros(r, c);
k = 0.04;

% Compute the Harris response at each pixel
for i = 1:r
    for j = 1:c
        M = [Ix2(i,j) Ixy(i,j); Ixy(i,j) Iy2(i,j)];
        R(i,j) = det(M) - k * (trace(M))^2;
    end
end

% Normalize the response matrix R
min_R = min(R(:));
max_R = max(R(:));
R = (R - min_R) / (max_R - min_R);

% Display the image and plot the detected corners
figure, imshow(I);
hold on;

% Non-maximum suppression and thresholding
threshold = 0.2;
for i = 3:r-2
    for j = 3:c-2
        if R(i,j) > threshold
            local_patch = R(i-2:i+2, j-2:j+2);
            if R(i,j) == max(local_patch(:))
                plot(j, i, 'o', 'Color', 'r', 'MarkerSize', 5, 'LineWidth', 1.5);
            end
        end
    end
end

hold off;
