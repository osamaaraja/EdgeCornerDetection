import cv2 as cv

image_path = "D:/Edge_detectors_ComputerVision/animal.jpeg"
img = cv.imread(image_path)

cv.imshow("Original Image", img)

# Converting the image to Grayscale
gray_img = cv.cvtColor(img, cv.COLOR_BGR2GRAY)
cv.imshow("Grayscale Image", gray_img)


# Applying Blur
blur_img = cv.GaussianBlur(img, (7,7), cv.BORDER_DEFAULT)
cv.imshow("Blurred Image", blur_img)

# Canny Edge Detector
canny_img = cv.Canny(img, 100, 175)
cv.imshow("Canny Edge Image", canny_img)

# Canny Edge Detector applied on the Blurred Image
canny_blur_img = cv.Canny(blur_img, 100, 175)
cv.imshow("Canny Edge on Blurred Image", canny_blur_img)

# Image Dilation
dilated_img = cv.dilate(canny_img, (7,7), iterations=3)
cv.imshow("Dilated Image", dilated_img)

# Eroding
eroded_img = cv.erode(dilated_img, (7,7), iterations=3)
cv.imshow("Eroded Image", eroded_img)
cv.waitKey(0)