import cv2 as cv
import numpy as np

# Load the original image
img = cv.imread('cats.jpg')
cv.imshow("Original", img)

# Convert the image to grayscale
img_gray = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow("Grayscale", img_gray)

# Blur the image before finding the edges
blurred_img = cv.GaussianBlur(img_gray, (7, 7), cv.BORDER_DEFAULT)

# Edge detection using Canny
canny_edge_img = cv.Canny(blurred_img, 125, 175)
cv.imshow("Canny Edge Image", canny_edge_img)

# Finding contours from the edge-detected image
contours, hierarchy = cv.findContours(canny_edge_img, cv.RETR_EXTERNAL, cv.CHAIN_APPROX_SIMPLE)
print(f"Number of contours found: {len(contours)}")

# Creating a blank image to draw the retrieved contours on
blank_img = np.zeros_like(img)

# Drawing the contours on the blank image
cv.drawContours(blank_img, contours, -1, (0, 0, 255), 1)
cv.imshow("Contours Image", blank_img)

cv.waitKey(0)
cv.destroyAllWindows()
