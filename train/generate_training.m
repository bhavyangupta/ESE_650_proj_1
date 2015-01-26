%%
% generate_training.m
% Bhavya
%
% Script used to generate training data .mat variables.
%
% Usage: run generate_training.m and select the roi in each image.
%        The H,S,V,class_label values are saved on disk as variables.
%

h_red = [];
s_red = [];
v_red = [];

h_not_red = [];
s_not_red = [];
v_not_red = [];

for i = 1:50
	%disp([char(i), 'abs']);
	source_name = [int2str(i) ,'.png'];
	target_name = [int2str(i) , '_ROI.png'];

    I = imread(source_name);
    I = im2double(I); % needed to use roi_poly
	training_class_label_mask = roipoly(I);
    
    I_hsv = rgb2hsv(I);
    h_channel = I_hsv(:,:,1);
    s_channel = I_hsv(:,:,2);
    v_channel = I_hsv(:,:,3);
    
    % These are column vectors
    h_red =[h_red; h_channel(training_class_label_mask)];
    s_red =[s_red; s_channel(training_class_label_mask)];
    v_red =[v_red; v_channel(training_class_label_mask)];
    
    h_not_red = h_channel(not(training_class_label_mask));
    s_not_red = s_channel(not(training_class_label_mask));
    v_not_red = v_channel(not(training_class_label_mask));
    
    
    
    
    
    imwrite(I_masked,target_name);
    
    
end