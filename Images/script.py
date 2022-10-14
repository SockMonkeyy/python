import cv2
from cv2 import resize

img = cv2.imread("python/Images/about-2.jpg",0)

print(img)

# Can be used to resize images
resized_image=cv2.resize(img,(750,500))

cv2.imshow("python/Images/about-2.jpg", resized_image)
cv2.waitKey(3000)
cv2.destroyAllWindows()
