fid = fopen('data1.dat', 'r');
jpeg_decode = fscanf(fid, '%s');
fclose(fid);
g = bin2dec(jpeg_decode(1:5));
height = bin2dec(jpeg_decode(6:15));
width = bin2dec(jpeg_decode(16:25));
jpeg_decode = jpeg_decode(26:end);

block_row = height/8;
block_col = width/8;

result = zeros(height, width);
last_DC = 0;

for i = 1:block_row
    for j = 1:block_col
        zigzag_stream = char.empty;
        [dif, bit_num] = decodeDC(jpeg_decode);
        jpeg_decode = jpeg_decode(bit_num+1:end);
        last_DC = dif + last_DC;
        zigzag_stream = last_DC;
        
        while(length(zigzag_stream)<64)
            [AC_value, zero_count, bit_num, EndOfBlock] = decodeAC(jpeg_decode);
            if(EndOfBlock)
                for k = 1:(64-length(zigzag_stream))
                    zigzag_stream = [zigzag_stream 0];
                end
                jpeg_decode = jpeg_decode(5:end);
            else
                for l = 1:zero_count
                    zigzag_stream = [zigzag_stream 0];
                end
                zigzag_stream = [zigzag_stream AC_value];
                jpeg_decode = jpeg_decode(bit_num+1:end);
            end
        end
        
        before_DCT = Izigzag(zigzag_stream);
        seg = Iquant_IDCT(before_DCT, g);
        jpeg_result(i*8-7:i*8, j*8-7: j*8) = seg;
    end
end

jpeg_result = uint8(jpeg_result);
imwrite(jpeg_result, 'pic1.jpg');