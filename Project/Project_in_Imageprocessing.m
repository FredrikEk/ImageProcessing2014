%%Project in Image Processing, RRY025
clear
clf

image = imread('film1_big.jpg');
imshow(image);
colons = 3;
rows = 5;
colors = 3;
imageHeight = size(image, 1)/rows;
imageWidth = size(image, 2)/colons;
%image1 = imcrop(image(:,:,:), [0 0 imageWidth imageHeight]);
image1 = mat2cell(image(:,:,:), imageHeight * ones(1, rows), imageWidth * ones(1,colons), ones(1, colors));
%figure, imshow(image1)

imTest = image1(2:end-1,1:end-5,:);

figure, imshow(imTest{1,2,1})

figure, imshow(image1{1,2,2})

figure, imshow(image1{1,2,3})
%%

image2 = image1(2,2,1:3)

imshow(image2{:,:,1})

%%
%imagea = image1(2,2,1:3);
%imagea{1,1,3}
left = shiftPictureLeft(image1(1,2,1:3), image1(3,2,1:3))
right = shiftPictureRight(image1(1,2,1:3), image1(3,2,1:3))