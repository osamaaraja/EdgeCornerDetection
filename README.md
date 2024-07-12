# Image Feature Detection

This repository contains MATLAB implementations of the Canny Edge Detector and the Harris Corner Detector. These scripts are used for detecting edges and corner points in images, which are fundamental tasks in computer vision.

## Contents

- `canny_edge_detector.m`: MATLAB script for the Canny edge detection algorithm.
- `harris_corner_detector.m`: MATLAB script for the Harris corner detection algorithm.

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
