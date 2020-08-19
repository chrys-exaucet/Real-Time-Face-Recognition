# FaceApp Face-Recognition

## I. Purpose
A real time face recognition and authentication application, with additional image processing in a user's gallery.

## II. Prerequisites
  - *MatlabR2020a* or higher
  - *App Designer*
  - Computer Vision Toolbox
  - Image Processing Toolbox
  - Statistics and Machine Learning Toolbox
  - Matlab Support Package for USB Webcams
  
  You can download and install necessary packages on Matlab Add-Ons site [here] ().
  Follow the tutorial available on the *FaceApp-Demo folder* for furher informations.
 
## III. Technologies

1. _*Viola-Jones*_ algorithm for face detection. More about it [here](https://en.wikipedia.org/wiki/Viola%E2%80%93Jones_object_detection_framework)
2. _*Eigenfaces*_ for face recognition and tracking. More about it [here](https://en.wikipedia.org/wiki/Eigenface)

You can still review the Ressourceful-Links.txt file for further iformations.



## IV. Application Structure

1. Authentication
The application opens on an authentication or registration interface by facial recognition.

![alt text](https://github.com/chrys-exaucet/Real-Time-Face-Recognition/blob/master/FaceApp-Demo/FaceApp-Connexion.PNG)

2. Image processing
 An authenticated user can, on an image in his database via his personal space:
 
  - apply a filter;
  - rotate;
  - display the names of the people in the photo;
  - reset or save changes.

![alt text](https://github.com/chrys-exaucet/Real-Time-Face-Recognition/blob/master/FaceApp-Demo/FaceApp-Gallery.PNG)


  
## V. Files

1. Connexion.mlapp 
The initial login interface with embedded real time face recognition. 
Follow the instructions given through the interface.
Do register your face before trying to be recognized.

2. UseInterface.mlapp 
It is the interface of the user's personal space. 
Must be called by the first interface! Otherwise, comment the first 3 lines of its startupfcn.
