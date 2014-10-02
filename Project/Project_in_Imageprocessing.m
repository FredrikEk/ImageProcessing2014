%%Project in Image Processing, RRY025
clear
clf

image = imread('film1_big.jpg');
imshow(image);
colons = 3;
rows = 5;
imageHeight = size(image, 1)/rows;
imageWidth = size(image, 2)/colons;
%image1 = imcrop(image(:,:,:), [0 0 imageWidth imageHeight]);
image1 = mat2cell(image(:,:,:), imageHeight * ones(1, rows), imageWidth * ones(1,colons), ones(1, colons));
%figure, imshow(image1)

figure, imshow(image1{1,2,1})

figure, imshow(image1{1,2,2})

figure, imshow(image1{1,2,3})
%%

image2 = image1(2,2,1:3)

imshow(image2{:,:,1})

%%
right = 0;
answer = Inf;
for i = 1:10

    r1 = image1{1,2,1};
    g1 = image1{1,2,2};
    b1 = image1{1,2,3};

    r2 = image1{2,2,1};
    g2 = image1{2,2,2};
    b2 = image1{2,2,3};
    
    %r1 = r1(1:(end-i), :);
    %r2 = r2(i+1:end, :);

    
    g1 = g1(1:(end-i), :);
    g2 = g2(i+1:end, :);

    b1 = b1(1:(end-i), :);
    b2 = b2(i+1:end, :);


    HnRed1 = imhist(r1)./numel(r1);
    HnGreen1 = imhist(g1)./numel(g1);
    HnBlue1 = imhist(b1)./numel(b1);

    HnRed2 = imhist(r2)./numel(r2);
    HnGreen2 = imhist(g2)./numel(g2);
    HnBlue2 = imhist(b2)./numel(b2);

    FRed = sum((HnRed1-HnRed2).^2);
    FGreen = sum((HnGreen1-HnGreen2).^2);
    FBlue = sum((HnBlue1-HnBlue2).^2);

    F = FRed + FGreen + FBlue

    if(F < answer)
       answer = F; 
       right = i;
    end
end

right