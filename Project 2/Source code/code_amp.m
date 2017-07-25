function  code  = code_amp( value )
code = dec2bin(abs(value));
if(value<0)
    for i=1:length(code)
        if(code(i)=='1')
            code(i)='0';
        else
            code(i)='1';
        end
    end
end

end