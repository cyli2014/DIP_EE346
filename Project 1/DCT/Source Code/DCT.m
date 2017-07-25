I = imread('4.jpg');
gray = rgb2gray(I);
pic1 = double(gray);
height = size(pic1, 1);
width = size(pic1, 2);
heightleft = 0;
widthleft = 0;
if rem(height, 8) ~= 0
    heightleft = 8 - rem(height, 8);
    pic1(height+1:height+heightleft, :) = zeros(heightleft, width);
end
if rem(width, 8) ~= 0
    widthleft = 8 - rem(width, 8);
    pic1(:, width+1:width+widthleft) = zeros(height+heightleft, widthleft);
end
height = height + heightleft;
width = width + widthleft;
A=zeros(8);
remain5 = [1 0 1 0 0 0 0 0
           1 0 0 0 0 0 0 0
           1 1 0 0 0 0 0 0
           0 0 0 0 0 0 0 0
           0 0 0 0 0 0 0 0
           0 0 0 0 0 0 0 0
           0 0 0 0 0 0 0 0
           0 0 0 0 0 0 0 0];
remain10 = [1 1 1 1 0 0 0 0
            1 1 0 1 0 0 0 0
            1 1 0 0 0 0 0 0
            1 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0];
remain20 = [1 1 1 1 1 0 0 0
            1 1 0 1 1 0 0 0
            1 1 1 0 1 0 0 0
            1 1 1 0 1 0 0 0
            0 1 1 0 0 0 0 0
            0 0 1 0 0 0 0 0
            0 0 0 0 0 0 0 0
            0 0 0 0 0 0 0 0];
for i=0:7
    for j=0:7
        if i==0
            a=sqrt(1/8);
        else
            a=sqrt(2/8);
        end            
        A(i+1,j+1)=a*cos(pi*(j+0.5)*i/8);
    end
end

for i = 1:8:height
    for j = 1:8:width
        seg = pic1(i:i+7, j:j+7);
        seg = A*seg*A';
        result(i:i+7, j:j+7) = seg;
        result5(i:i+7, j:j+7) = seg.*remain5;
        result10(i:i+7, j:j+7) = seg.*remain10;
        result20(i:i+7, j:j+7) = seg.*remain20;
    end
end

for i = 1:8:height
    for j = 1:8:width
        seg0 = result(i:i+7, j:j+7);
        pic0(i:i+7, j:j+7) = A'*seg0*A;
        seg5 = result5(i:i+7, j:j+7);
        pic5(i:i+7, j:j+7) = A'*seg5*A;
        seg10 = result10(i:i+7, j:j+7);
        pic10(i:i+7, j:j+7) = A'*seg10*A;
        seg20 = result20(i:i+7, j:j+7);
        pic20(i:i+7, j:j+7) = A'*seg20*A;
    end
end

pic0 = pic0(1:height-heightleft, 1:width-widthleft);
pic0 = uint8(pic0);
PSNR0 = PSNR(pic0, gray);
pic5 = pic5(1:height-heightleft, 1:width-widthleft);
pic5 = uint8(pic5);
PSNR5 = PSNR(pic5, gray);
pic10 = pic10(1:height-heightleft, 1:width-widthleft);
pic10 = uint8(pic10);
PSNR10 = PSNR(pic10, gray);
pic20 = pic20(1:height-heightleft, 1:width-widthleft);
pic20 = uint8(pic20);
PSNR20 = PSNR(pic20, gray);

subplot(2,3,1), imshow(I), title('Origin');
subplot(2,3,2), imshow(gray), title('Gray');
imwrite(gray, '灰度图像.jpg');
subplot(2,3,3), imshow(pic0), title('Total');
imwrite(pic0, '保留全部系数.jpg');
subplot(2,3,4), imshow(pic5), title('5 remains');
imwrite(pic5, '保留前5个系数.jpg');
subplot(2,3,5), imshow(pic10), title('10 remains');
imwrite(pic10, '保留前10个系数.jpg');
subplot(2,3,6), imshow(pic20), title('20 remains');
imwrite(pic20, '保留前20个系数.jpg');