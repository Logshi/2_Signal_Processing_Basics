% Edge Detection Using Sobel Filter
% Read an image
img = imread('image.jpg');
gray_img = rgb2gray(img);

% Apply Sobel filter for edge detection
edge_sobel = edge(gray_img, 'sobel');

% Display the original and edge-detected image
subplot(1,2,1);
imshow(gray_img);
title('Original Image');
subplot(1,2,2);
imshow(edge_sobel);
title('Sobel Edge Detection');