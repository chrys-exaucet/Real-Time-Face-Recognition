Video01 = VideoReader('Video_Test.mp4');
Video01_Frame = readFrame (Video01);
Face_Detector = vision.CascadeObjectDetector();
Face_Location = step(Face_Detector,Video01_Frame);

Detected_Frame = insertShape(Video01_Frame, 'Rectangle', Face_Location);
rectangle_to_Points = bbox2points(Face_Location(1,:));
feature_Points = detectMinEigenFeatures(rgb2gray(Detected_Frame),'ROI',Face_Location);
pointTracker = vision.PointTracker('MaxBidirectionalError',2);
feature_Points = feature_Points.Location;
initialize(pointTracker,feature_Points,Detected_Frame);

left = 100 ;
bottom = 100;
width = size(Detected_Frame, 2);
height = size(Detected_Frame,1);
video_Player = vision.VideoPlayer('Position',[left bottom width height]);

previous_Points = feature_Points;

while hasFrame(Video01)
    Video_Frame = readFrame(Video01);
    [feature_Points, isFound] = step(pointTracker,Video_Frame);
    new_Points = feature_Points(isFound,:);
    old_Points = previous_Points(isFound,:);
    
    if size(new_Points,1) >= 2
        [transformed_Rectangle,old_Points,new_Points]= estimateGeometricTransform(old_Points,new_Points,...
            'similarity','MaxDistance',4);
    rectangle_to_Points = transformPointsForward(transformed_Rectangle, rectangle_to_Points);
    
    reshaped_Rectangle = reshape(rectangle_to_Points',1,[]);
    insertShape(Video_Frame,'Polygon',reshaped_Rectangle,'LineWidth',2);
    Detected_Frame = insertMarker(Detected_Frame,new_Points,'Color','White');
    end
    step(video_Player,Detected_Frame);
end
release(video_Player);