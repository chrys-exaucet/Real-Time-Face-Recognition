% Test de détection de visage sur une image 

Face1 = imread('Snapchat-85890003.jpg'); % Variable that content the image
[width, height] = size (Face1); % Giving image size to width and height variables 

if (width > 320) 
    Face1_Resize = imresize(Face1, [320, NaN]); % Resize image width to 320 and store in Facz1_Resize. NaN (Do not precise height)
end

Face_Detector = vision.CascadeObjectDetector(); % Object that detect face on image

Location_of_Face = step(Face_Detector, Face1_Resize); % Detected face location

Detected_Image=insertShape(Face1_Resize,'Rectangle', Location_of_Face); % Add shape to detected face location

figure;
imshow(Detected_Image); % Show detected face location
title('Detected Face');
