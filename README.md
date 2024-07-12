# Image Feature Detection

This repository contains MATLAB implementations of the Canny Edge Detector, the Harris Corner Detector, and the Sobel Operator. These scripts are used for detecting edges and corner points in images, which are fundamental tasks in computer vision.

## Contents

- `Canny_ED.m`: MATLAB script for the Canny edge detection algorithm.
- `Harris_CP.m`: MATLAB script for the Harris corner detection algorithm.
- `Sobel_Operator.m`: MATLAB script for the Sobel operator edge detection algorithm.

## Canny Edge Detector

The Canny Edge Detector is a multi-stage algorithm to detect a wide range of edges in images. The steps include:

1. Applying a Gaussian filter to smooth the image.
2. Calculating the image gradients using the Sobel operator.
3. Performing non-maximum suppression to thin the edges.
4. Applying double thresholding to identify strong and weak edges.
5. Using edge tracking by hysteresis to finalize edge detection.

## Harris Corner Detector

The Harris Corner Detector identifies points in an image where the intensity changes significantly in multiple directions. The steps include:

1. Calculating image gradients.
2. Computing the second moment matrix.
3. Calculating the Harris response for each pixel.
4. Identifying corners by applying a threshold to the Harris response.


## Sobel Operator

The Sobel Operator is a simple and efficient method for edge detection that computes the gradient magnitude of the image. The steps include:

1. Converting the image to grayscale.
2. Applying the Sobel filter to calculate the gradients in the x and y directions.
3. Computing the gradient magnitude to highlight the edges.

