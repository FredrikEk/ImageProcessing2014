function shift = shiftPictureRight(image1, image2) 

right = 0;
answer = Inf;
for i = 1:50
    
    height = size(image1{1,1,1}, 1);
    width = size(image1{1,1,1}, 2);
    
    r1 = imcrop(image1{1,1,1}, [width*0.2 height*0.2 width*0.8 height*0.8]);
    g1 = imcrop(image1{1,1,2}, [width*0.2 height*0.2 width*0.8 height*0.8]);
    b1 = imcrop(image1{1,1,3}, [width*0.2 height*0.2 width*0.8 height*0.8]);

    r2 = imcrop(image2{1,1,1}, [width*0.2 height*0.2 width*0.8 height*0.8]);
    g2 = imcrop(image2{1,1,2}, [width*0.2 height*0.2 width*0.8 height*0.8]);
    b2 = imcrop(image2{1,1,3}, [width*0.2 height*0.2 width*0.8 height*0.8]);
    
    r1 = r1(:, 1:(end-(i-1)));
    r2 = r2(:, i:end);
    
    g1 = g1(:, 1:(end-(i-1)));
    g2 = g2(:, i:end);

    b1 = b1(:, 1:(end-(i-1)));
    b2 = b2(:, i:end);


    HnRed1 = imhist(r1)./numel(r1);
    HnGreen1 = imhist(g1)./numel(g1);
    HnBlue1 = imhist(b1)./numel(b1);

    HnRed2 = imhist(r2)./numel(r2);
    HnGreen2 = imhist(g2)./numel(g2);
    HnBlue2 = imhist(b2)./numel(b2);

    %HnRed1 = imhist(r1);
    %HnGreen1 = imhist(g1);
    %HnBlue1 = imhist(b1);
    
    %HnRed2 = imhist(r2);
    %HnGreen2 = imhist(g2);
    %HnBlue2 = imhist(b2);
    
    FRed = sum((HnRed1-HnRed2).^2);
    FGreen = sum((HnGreen1-HnGreen2).^2);
    FBlue = sum((HnBlue1-HnBlue2).^2);

    F = FGreen + FBlue;

    if(F < answer)
       answer = F; 
       right = i;
    end
end

shift = right;

end
