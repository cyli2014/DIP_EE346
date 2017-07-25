function AC_code = codeAC(zigzag_stream)
AC_code = char.empty;
zero_count = 0;
for i = 2:64
    if(sum(abs(zigzag_stream(i:end)))==0)
        AC_code = [AC_code '1010'];
        break;
    else
        if(zero_count == 16)
            AC_code = [AC_code '11111111001'];
            zero_count = 0;
        else
            if(zigzag_stream(i)~=0)
                size = find_size_AC(zigzag_stream(i));
                size_hex = dec2hex(size);
                runlength_hex = dec2hex(zero_count);
                middle_format = [runlength_hex size_hex];
                middle_Huffman = code_size_AC(middle_format);
                amp_Huffman = code_amp(zigzag_stream(i));
                AC_code = [AC_code middle_Huffman amp_Huffman];
                zero_count = 0;
            else
                zero_count = zero_count + 1;
            end
        end
    end
end