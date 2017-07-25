function [AC_value, zero_count, bit_num, EndOfBlock] = decodeAC(jpeg_decode)

    [runsize, code_length_AC] = decode_size_AC(jpeg_decode);
    
    if (strcmp(runsize,'00'))
        EndOfBlock = boolean (1);
        AC_value = 0;
        bit_num = 4;
        zero_count = 0;
    else
        EndOfBlock = boolean (0);
        size = hex2dec(runsize(2));
        zero_count = hex2dec(runsize(1));

        ad_bit = size;

        AC_value = decode_value(jpeg_decode, code_length_AC, ad_bit);
        bit_num = code_length_AC + ad_bit;
    end
end
