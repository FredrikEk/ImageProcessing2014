function shift = shiftPictureLeft(image1, image2) 

left = 0;
answer2 = Inf;

for i = 1:50
    
    r1 = image1{1,1,1};
    g1 = image1{1,1,2};
    b1 = image1{1,1,3};

    r2 = image2{1,1,1};
    g2 = image2{1,1,2};
    b2 = image2{1,1,3};
    
    r1 = r1(:, i:end);
    r2 = r2(:, 1:(end-(i-1)));
    
    g1 = g1(:, i:end);
    g2 = g2(:, 1:(end-(i-1)));

    b1 = b1(:, i:end);
    b2 = b2(:, 1:(end-(i-1)));


    HnRed1 = imhist(r1)./numel(r1);
    HnGreen1 = imhist(g1)./numel(g1);
    HnBlue1 = imhist(b1)./numel(b1);

    HnRed2 = imhist(r2)./numel(r2);
    HnGreen2 = imhist(g2)./numel(g2);
    HnBlue2 = imhist(b2)./numel(b2);

    FRed = sum((HnRed1-HnRed2).^2);
    FGreen = sum((HnGreen1-HnGreen2).^2);
    FBlue = sum((HnBlue1-HnBlue2).^2);

    F = FGreen + FBlue;
    
    if(F < answer2)
       answer2 = F; 
       left = i;
    end
end

shift = left;

end