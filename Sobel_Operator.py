import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

img = cv.imread('sports_.jpg')
cv.imshow('Original', img)

# converting the image to gray scale
gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow('Grayscale', gray_img)

# Laplacian Method
laplacian = cv.Laplacian(gray_img, cv.CV_64F)
laplacian = np.uint8(np.abs(laplacian))# takes in source image (gray scale), data depth
cv.imshow('Laplacian Image', laplacian)

# Sobel Method
sobel_x = cv.Sobel(gray_img, cv.CV_64F, 1, 0)
sobel_y = cv.Sobel(gray_img, cv.CV_64F, 0, 1)
cv.imshow('Sobel_x', sobel_x)
cv.imshow('Sobel_y', sobel_y)

combined_sobel = cv.bitwise_or(sobel_x, sobel_y)
cv.imshow('Combined sobel', combined_sobel)

# including canny for comparison
canny_img = cv.Canny(gray_img, 150, 175)
cv.imshow('Canny', canny_img)


plt.figure(figsize=(20,10))
plt.subplot(1,3,1)
plt.title('Laplacian Image')
plt.imshow(laplacian, cmap='gray')

plt.subplot(1,3,2)
plt.title('Sobel Image')
plt.imshow(combined_sobel, cmap='gray')

plt.subplot(1,3,3)
plt.title('Canny Image')
plt.imshow(canny_img, cmap='gray')

plt.tight_layout()
plt.show()


cv.waitKey(0)