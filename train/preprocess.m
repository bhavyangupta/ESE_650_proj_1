%%
% preprocess.m
% Bhavya
%
% Convinience script to aid in region of interest identification 
%

for i = 1:50
	%disp([char(i), 'abs']);
	source_name = [int2str(i) ,'.png'];
	target_name = [int2str(i) , '_ROI.png'];
	I = imread(source_name);
    I = im2double(I);
	mask = roipoly(I);
	I_masked = I .* repmat(mask,[1,1,3]);

	imwrite(I_masked,target_name);

end