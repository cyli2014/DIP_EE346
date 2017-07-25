I = imread('4.bmp');
gray = double(rgb2gray(I));
[height, width] = size(gray);
g = input('Compress coeficient = ');
block_row = height/8;
block_col = width/8;

last_DC = 0;
jpeg_code = char.empty;

for i = 1:block_row
    for j = 1:block_col
        seg = gray(i*8-7:i*8, j*8-7:j*8)-127;
        after_DCT = DCT_Quant(seg,g);
        zigzag_stream = Zigzag(after_DCT);
        DC_code = codeDC(zigzag_stream(1)-last_DC);
        AC_code = codeAC(zigzag_stream);
        code_block = [DC_code AC_code];
        jpeg_code = [jpeg_code code_block];
        last_DC = zigzag_stream(1);
    end
end

height = dec2bin(height);
while(length(height)<10)
    height = ['0' height];
end
width = dec2bin(width);
while(length(width)<10)
    width = ['0' width];
end
g = dec2bin(g);
while(length(g)<5)
    g = ['0' g];
end

jpeg_code = [g height width jpeg_code];
compress_ratio = height*width*8/length(jpeg_code)
compress_efficiency = length(jpeg_code)/(height*width)

fid = fopen('data1.dat', 'wt');
fwrite(fid, jpeg_code, 'uchar');
fclose(fid);