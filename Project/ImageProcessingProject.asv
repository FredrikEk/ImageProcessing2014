%%Project in Image Processing, RRY025

clear
close all

image = imread('film1_big.jpg');
imshow(image);
size(image)
colons = 3;
rows = 5;
colors = 3;

preOffset = [4, 2, 2, 4];

shift = ones(5, 1);
imageHeight = size(image, 1)/rows;
imageWidth = size(image, 2)/colons;
image1 = mat2cell(image(:,:,:), imageHeight * ones(1, rows), imageWidth * ones(1,colons), ones(1, colors));

for i = 1:rows
    for j = 1:colons
        for k = 1:colors
            tempimg = image1{i,j,k};
            tempimg = tempimg(preOffset(1):end-preOffset(2),preOffset(3):end-preOffset(4));
            image1{i,j,k} = tempimg;
        end
    end
end

height = size(image1{1,2,3}, 1);
width = size(image1{1,2,3}, 2);

subregion1 = [width*0.2 height*0.4 width*0.6 height*0.6];
subregion2 = [0 0 width height];

figure;
for testPicture = 1:rows

    pic1 = cell2mat(image1(testPicture,2,1:3));
    subimage1 = imcrop(pic1, subregion1);

    for i = 1:rows
        subimage2 = cell2mat(image1(i,2,1:3));

        c = normxcorr2(subimage1(:,:,3),subimage2(:,:,3));
        [max_c, imax] = max(abs(c(:)));
        [ypeak, xpeak] = ind2sub(size(c), imax(1));
        corr_offset = [(xpeak-size(subimage1,2)) 
                       (ypeak-size(subimage1,1))];

        rect_offset = [(subregion2(1)-subregion1(1)) 
                       (subregion2(2)-subregion1(2))];

        offset = corr_offset + rect_offset;
        xoffset = round(offset(1));

        shift(i) = xoffset;
    end

    sbarray = cell(5, 1);
    for i = 1:rows
       img = cell2mat(image1(i, 2, 1:3));
       sbarray{i} = img;
    end
    
    image12 = sbarray{1};
    
    for c = 1:colors
        for i = 1:size(image12,1)
            for j = 1:size(image12,2)
                point = ones(1,5);
                arraySize = 0;
                for k = 1:rows
                    if(j + shift(k) >= 1 && j + shift(k) < width-1)
                        arr = sbarray{k};
                        point(k-arraySize) = arr(i,j+shift(k),c);
                    else
                        point(k-arraySize) = [];
                        arraySize = arraySize+1;
                    end
                end
                image12(i,j,c) = median(point);
            end
        end
    end

    subplot(2,5,testPicture), imshow(cell2mat(image1(testPicture,2,1:3)));
    subplot(2,5,testPicture+5), imshow(image12);
end