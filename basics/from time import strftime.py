import time
import cv2
from time import strftime
while True:
    print(strftime("%a, %d %b %Y %I:%M:%S %p %Z", time.localtime()))
    time.sleep(60)