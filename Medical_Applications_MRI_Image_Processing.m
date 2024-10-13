% Read an MRI image
mri_image = imread('mri_image.jpg');

% Convert to grayscale
gray_mri = rgb2gray(mri_image);

% Apply thresholding for segmentation
threshold_value = 100;
segmented_image = gray_mri > threshold_value;

% Display the original and segmented images
subplot(1,2,1);
imshow(gray_mri);
title('Original MRI Image');
subplot(1,2,2);
imshow(segmented_image);
title('Segmented MRI Image');
