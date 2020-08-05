clear all
cam = webcam();
cam.Resolution = '424x240';
video_Frame = snapshot(cam);

video_Player = vision.VideoPlayer('Position', [100 100 424 240]);
Face_Detector = vision.CascadeObjectDetector();
point_Tracker = vision.PointTracker('MaxBidirectionalError',2);
run_loop = true;
number_of_Points = 0; 
frame_Count = 0;

while run_loop && frame_Count < 400
    video_Frame = snapshot(cam);
    gray_Frame = rgb2gray(video_Frame);
    frame_Count = frame_Count + 1;
    
    if number_of_Points < 10
           face_Rectangle = Face_Detector.step(gray_Frame);
           
           if ~isempty(Face_Detector)
               points= detectMinEigenFeatures(gray_Frame,'ROI',face_Rectangle(1,:));
               
               xy_Points = points.Location;
               number_of_Points = size(xy_Points,1);
               initialize(point_Tracker,xy_Points,gray_Frame);
               previous_Points = xy_Points;
               rectangle = bbox2points(face_Rectangle(1,:));
               face_Polygon = reshape(rectangle',1,[]);
               
               video_Frame = insertShape(video_Frame,'Polygon',face_Polygon,'LineWidth',3);
               video_Frame = insertMarker(video_Frame,xy_Points,'+','Color','White');
           end
    else
        [xy_Points,isFound] = step(point_Tracker,gray_Frame);
        new_Points = xy_Points(isFound,:);
        old_Points = previous_Points(isFound,:);
        
        number_of_Points = size(new_Points,1);
        
        if number_of_Points >= 10
            [xform, old_Points,new_Points] = estimateGeometricTransform(...
                old_Points,new_Points,'similarity','MaxDistance',4);
            rectangle = transformPointsForward(xform,rectangle);
            face_Polygon = reshape(rectangle',1,[]);
            video_Frame = insertShape(video_Frame,'Polygon',face_Polygon,'LineWidth',3);
            
            previous_Points = new_Points;
            setPoints(point_Tracker,previous_Points);
        end
    end
    step(video_Player,video_Frame);
    run_loop = isOpen(video_Player);        
end

clear cam
release(video_Player);
release(video_Frame);
release(Face_Detector);
