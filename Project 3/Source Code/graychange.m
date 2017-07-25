clear;
I = imread('aerial.bmp');
gray = I;
equal = I;
[height, width] = size(gray);
histogram = zeros(1,256);
for i = 1:height
    for j = 1:width
        histogram(gray(i,j)+1) = histogram(gray(i,j)+1)+1;
    end
end

subplot(2,4,1);
imshow(gray);
title('Origin');

subplot(2,4,5);
imhist(gray);
axis([0,255,0,5500]);
title('Origin Histogram');

x1 = 0;
y1 = 0;
x2 = 150;
y2 = 64;
x3 = 255;
y3 = 255;

a = polyfit([x1,x2],[y1,y2],1);
b = polyfit([x2,x3],[y2,y3],1);
result1 = double(gray);
for i=1:height
    for j = 1:width
        if(gray(i,j) < x2)
            result1(i,j)=a(1)*result1(i,j)+a(2);
        else
            result1(i,j)=b(1)*result1(i,j)+b(2);
        end
    end
end
result1 = uint8(result1);

subplot(2,4,2);
imshow(result1);
title('Seged Tran.');
imwrite(result1, 'Seged.bmp');

subplot(2,4,6);
imhist(result1);
axis([0,255,0,5500]);
title('Seged Tran. Histogram');

gray = double(gray);
result = gray.*gray./255;
result = uint8(result);
subplot(2,4,3);
imshow(result);
title('Unlinear Tran.');
imwrite(result, 'Unlinear.bmp');

subplot(2,4,7);
imhist(result);
axis([0,255,0,5500]);
title('Unlinear Tran. Histogram');

histogram = histogram./(height*width);

cdf = zeros(1,256);
cdf(1) = histogram(1);
for i=2:256
    cdf(i) = cdf(i-1) + histogram(i);
end

cdf = uint8(255.*cdf);
for i = 1:height
    for j = 1:width
        equal(i, j) = cdf(equal(i, j));
    end
end

subplot(2,4,4);
imshow(equal);
title('Histogram Equal');
imwrite(equal, 'Equal.bmp');

subplot(2,4,8);
imhist(equal);
axis([0,255,0,5500]);
title('Histogram Equal Histogram');