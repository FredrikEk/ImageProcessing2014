function shift = shiftPictureRight(image1, image2) 

right = 0;
answer = Inf;
for i = 1:50

    r1 = image1{1,1,1};
    g1 = image1{1,1,2};
    b1 = image1{1,1,3};

    r2 = image2{1,1,1};
    g2 = image2{1,1,2};
    b2 = image2{1,1,3};
    
    %r1 = r1(1:(end-i), :);
    %r2 = r2(i+1:end, :);

    
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

    FRed = sum((HnRed1-HnRed2).^2);
    FGreen = sum((HnGreen1-HnGreen2).^2);
    FBlue = sum((HnBlue1-HnBlue2).^2);

    F = FRed + FGreen + FBlue;

    if(F < answer)
       answer = F; 
       right = i;
    end
end

shift = right;

end
