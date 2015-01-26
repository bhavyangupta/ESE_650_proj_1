%%
% preprocess.m
% Bhavya
%
% Convinience script to aid in region of interest identification 
%
% Usage: run preprocess.m and select the roi in each image. Roi is
% segmented and stored as a separate image.
%
%

for i = 1:50
	%disp([char(i), 'abs']);
	source_name = [int2str(i) ,'.png'];
	target_name = [int2str(i) , '_ROI.png'];

    I = imread(source_name);
    I = im2double(I); % needed to use roi_poly
	training_class_label = roipoly(I);
	%I_masked = I .* repmat(class_label,[1,1,3]);
	
    
    
    
    
    imwrite(I_masked,target_name);
    
    
end