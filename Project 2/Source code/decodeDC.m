function [dif, bit_num] = decodeDC(jpeg_decode)
[DC_size, ad_bit, code_length] = decode_size_DC(jpeg_decode);
dif = decode_value(jpeg_decode, code_length, ad_bit);
bit_num = code_length + ad_bit;
end