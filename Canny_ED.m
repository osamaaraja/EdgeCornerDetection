% Initialization
close all;
clear all;
clc;

% Read and display the input image
image1 = imread('grocery.jpg');
imshow(image1);

% Convert the image to grayscale and to double precision
Img = rgb2gray(image1); % converting the rgb image to a gray level image
Img = im2double(Img);

% Apply a Gaussian filter to smooth the image
gaussian = [1 2 1; 2 4 2; 1 2 1];
gaussian = gaussian / sum(gaussian(:)); % Normalize the Gaussian filter
g_image = imfilter(Img, gaussian);

% Apply Sobel operator to get gradients
sobel_x = [-1 0 1; -2 0 2; -1 0 1]; 
sobel_y = [1 2 1; 0 0 0; -1 -2 -1];

s_g_image_grad_x = conv2(g_image, sobel_x, 'same');
s_g_image_grad_y = conv2(g_image, sobel_y, 'same');

% Compute the gradient magnitude
mag_image = sqrt(s_g_image_grad_x.^2 + s_g_image_grad_y.^2);

% Compute the gradient direction
[r, c] = size(Img);
ornt_img = atan2(s_g_image_grad_y, s_g_image_grad_x) + (pi / 2);

% Non-maximum suppression
for m = 2:r-1
    for n = 2:c-1
        direction = ornt_img(m, n);
        if (direction >= 0 && direction < pi / 4)
            inter_distance = tan(direction);
            value1 = (1 - inter_distance) * mag_image(m-1, n) + inter_distance * mag_image(m-1, n-1);
            value2 = (1 - inter_distance) * mag_image(m+1, n) + inter_distance * mag_image(m+1, n+1);
        elseif (direction >= pi / 4 && direction < pi / 2)
            inter_distance = tan(direction - pi / 4);
            value1 = (1 - inter_distance) * mag_image(m-1, n-1) + inter_distance * mag_image(m, n-1);
            value2 = (1 - inter_distance) * mag_image(m+1, n+1) + inter_distance * mag_image(m, n+1);
        elseif (direction >= pi / 2 && direction < 3 * pi / 4)
            inter_distance = tan(direction - pi / 2);
            value1 = (1 - inter_distance) * mag_image(m, n-1) + inter_distance * mag_image(m+1, n-1);
            value2 = (1 - inter_distance) * mag_image(m, n+1) + inter_distance * mag_image(m-1, n+1);
        else
            inter_distance = tan(direction - 3 * pi / 4);
            value1 = (1 - inter_distance) * mag_image(m+1, n-1) + inter_distance * mag_image(m+1, n);
            value2 = (1 - inter_distance) * mag_image(m-1, n+1) + inter_distance * mag_image(m-1, n);
        end

        if (mag_image(m, n) < value1 || mag_image(m, n) < value2)
            mag_image(m, n) = 0;
        end
    end
end

figure, imshow(mag_image), title('Non-Maximum Suppression'), impixelinfo;

% Double thresholding
low_thres = 0.1;
high_thres = 0.3;

edges = zeros(r, c);
strong_edges = mag_image > high_thres;
weak_edges = (mag_image > low_thres) & (mag_image <= high_thres);

edges(strong_edges) = 1;
edges(weak_edges) = 0.5;

% Edge tracking by hysteresis
for m = 2:r-1
    for n = 2:c-1
        if edges(m, n) == 0.5
            if any(any(edges(m-1:m+1, n-1:n+1) == 1))
                edges(m, n) = 1;
            else
                edges(m, n) = 0;
            end
        end
    end
end

figure, imshow(edges), title('Canny Edge Detection');

