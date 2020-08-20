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
  
  You can download and install necessary packages on Matlab Add-Ons site [here](https://www.mathworks.com/products/matlab/add-on-explorer.html).
  Follow the tutorial available on the *FaceApp-Demo folder* for furher informations.
 
## III. Technologies

1. _*Viola-Jones*_ algorithm for face detection. More about it [here](https://en.wikipedia.org/wiki/Viola%E2%80%93Jones_object_detection_framework).
2. _*Eigenfaces*_ for face recognition and tracking. More about it [here](https://en.wikipedia.org/wiki/Eigenface).

       You can still review the *Ressourceful-Links.txt* file for further informations.



## IV. Application Structure

                            1. Authentication
                                           
  The application opens on an authentication or registration interface by facial recognition.

![alt text](https://github.com/chrys-exaucet/Real-Time-Face-Recognition/blob/master/FaceApp-Demo/FaceApp-Connexion.PNG)

                            2. Image processing
                                             
  An authenticated user can, on an image in his database via his personal space:
  - load any image;
  - apply a filter;
  - rotate;
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

                           3. Database

  Database folder called inside the Connexion.mlapp to recognize regeistered faces. You can add there your set of faces, each in a signle folder.
  Note the the way you will name your folder inside the database is the name you should use to get registered with the app.

  If you move the database folder elsewhere or change its name, please modify the database private property inside the Connexion.mlapp accordingly.

                           4. FaceApp-Demo
  Contains demo videos and photos of the app installation, look&feel and behavior.
  You may look at it for convenience.

                           5. FaceAppLogo.jpg

  The Logo of the  application, visible via the second interface. 

  If you move the file elsewhere or change its name, please modify the logo private property inside the UserInterface.mlapp accordingly.

                           6. Ressourceful-Links

  Helps you dig deeper the topic and technologies used.

                           7. FaceApp-Team.jpg

  The set of contributors to the project. Want to be one of them? Send a pull request, signal an isssue of a new feature you want!
  
                          Email us at: chrysexaucet@hotmail.fr, jeanlucsanou@gmail.com or  seanombe@gmail.com
  
  ![alt text](https://github.com/chrys-exaucet/Real-Time-Face-Recognition/blob/master/FaceApp-Team.jpg)
