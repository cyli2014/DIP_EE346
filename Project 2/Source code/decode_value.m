function decode_value = decode_value( code, code_length, ad_bit )

    if (ad_bit == 0)
        decode_value = 0;
    else
        if(code(code_length+1)=='0')
           for i=code_length+1:length(code)
                    if(code(i)=='1')
                        code(i)='0';
                    else
                        code(i)='1';
                    end
           end
           decode_value = -bin2dec(code(code_length+1:code_length+ad_bit));%还原，二进制转十进制
        else
           decode_value = bin2dec(code(code_length+1:code_length+ad_bit));
        end

    end

end