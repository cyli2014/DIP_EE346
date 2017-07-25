function [ size, ad_bit, code_length ] = decode_size_DC( code )

    if (code(1)=='0')
        if(code(2)=='0')
            size = 0;
            ad_bit = 0;
            code_length = 2;
        else
            if (code(3)=='0')
                size = 1;
                ad_bit = 1;
                code_length = 3;
            else
                size = 2;
                ad_bit = 2;
                code_length = 3;
            end;
        end;
    else %code(1)==1
        if(code(2)=='0')
            if (code(3)=='0')
                size = 3;
                ad_bit = 3;
                code_length = 3;
            else
                size = 4;
                ad_bit = 4;
                code_length = 3;
            end;
        else %code(2)==1
            if(code(3)=='0')
                size = 5;
                ad_bit = 5;
                code_length = 3;
            else %code(3)==1
                if(code(4)=='0')
                    size = 6;
                    ad_bit = 6;
                    code_length = 4;
                else %code(4)==1
                    if(code(5)=='0')
                        size = 7;
                        ad_bit = 7;
                        code_length = 5;
                    else %code(5)==1
                        if(code(6)=='0')
                            size = 8;
                            ad_bit = 8;
                            code_length = 6;
                        else %code(6)==1
                            if(code(7)=='0')
                                size = 9;
                                ad_bit = 9;
                                code_length = 7;
                            else %code(7)==1
                                if(code(8)=='0')
                                    size = 10;
                                    ad_bit = 10;
                                    code_length = 8;
                                else
                                    size = 11;
                                    ad_bit = 11;
                                    code_length = 9;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;


end

