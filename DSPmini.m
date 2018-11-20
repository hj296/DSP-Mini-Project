obj = imread('rugby.jpg');
imshow(obj)

%%Segmenting image
%% Divide image "obj" into its respective RGB intenstites

red = obj(:,:,1);
green = obj(:,:,2);
blue = obj(:,:,3);

figure(1)
subplot(2,2,1); imshow(obj); title('Original Image');
subplot(2,2,2); imshow(red); title('Red Plane');
subplot(2,2,3); imshow(green); title('Green Plane');
subplot(2,2,4); imshow(blue); title('Blue Plane');

%Threshold the blue plane
figure(2)
level = 0.37;
bw2 = im2bw(blue,level);
subplot(2,2,1);imshow(bw2); title('Blue plane threshold')

%%Remove Noise

%%Fill any holes
fill = imfill(bw2, 'holes');
subplot(2,2,2); imshow(fill); title('Holes Filled');

%%Remove any blbs on the border of the image
clear = imclearborder(fill);
subplot(2,2,3); imshow(clear); title('Remove blobs on border');

%%Remove blobs that are smaller than 7 pixels across

se = strel('disk',7);
open = imopen(fill,se);
subplot(2,2,4); imshow(clear); title('Remove small blobs')

%% Measure Onject Diameter

diameter = regionprops(open,'MajorAxisLength');

%%Show result
figure(3)
imshow(obj)
d = imdistline; %%Include a line to physically measure the ball
