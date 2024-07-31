import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

# Load the image
img = cv.imread('animal.jpeg')
if img is None:
    raise ValueError("Image not found or unable to load")

# Convert to grayscale
gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
gray_img = np.float32(gray_img)

# Apply the Harris corner detector
dst = cv.cornerHarris(gray_img, blockSize=2, ksize=3, k=0.04)

# Dilate the result to mark the corners
dst = cv.dilate(dst, None)

# Threshold to mark the corners in the original image
img[dst > 0.01 * dst.max()] = [0, 0, 255]

# Display the results
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
plt.title('Original Image')
plt.imshow(cv.cvtColor(cv.imread('animal.jpeg'), cv.COLOR_BGR2RGB))
plt.axis('off')

plt.subplot(1, 2, 2)
plt.title('Harris Corner Detection')
plt.imshow(cv.cvtColor(img, cv.COLOR_BGR2RGB))
plt.axis('off')

plt.tight_layout()
plt.show()
