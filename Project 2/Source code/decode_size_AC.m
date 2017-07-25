function [ runsize, code_length ] = decode_size_AC( code )
runsize = char.empty;

if (code(1)=='0')
    if (code(2)=='0')
        runsize = '01'; %00
        code_length = 2;
    else
        runsize = '02'; %01
        code_length = 2;
    end
else
    if (code(2)=='0')
        if (code(3)=='0')
            runsize = '03'; %100
            code_length = 3;
        else
            if (code(4)=='0')
                runsize = '00'; %1010
                code_length = 4;
            else
                runsize = '04'; %1011
                code_length = 4;
            end
        end
    else
        if (code(3)=='0')
            if (code(4)=='0')
                runsize = '11'; %1100
                code_length = 4;
            else
                if (code(5)=='0')
                    runsize = '05'; %11010
                    code_length = 5;
                else
                    runsize = '12'; %11011
                    code_length = 5;
                end
            end
        else
            if (code(4)=='0')
                if (code(5)=='0')
                    runsize = '21'; %11100
                    code_length = 5;
                else
                    if (code(6)=='0')
                        runsize = '31'; %111010
                        code_length = 6;
                    else
                        runsize = '41'; %111011
                        code_length = 6;
                    end
                end
            else
                if (code(5)=='0')
                    if (code(6)=='0')
                        if (code(7)=='0')
                            runsize = '06'; %1111000
                            code_length = 7;
                        else
                            runsize = '13'; %1111001
                            code_length = 7;
                        end
                    else
                        if (code(7)=='0')
                            runsize = '51'; %1111010
                            code_length = 7;
                        else
                            runsize = '61'; %1111011
                            code_length = 7;
                        end
                    end
                    
                else
                    if (code(6)=='0')
                        if (code(7)=='0')
                            if (code(8)=='0')
                                runsize = '07'; %11111000
                                code_length = 8;
                            else
                                runsize = '22'; %11111001
                                code_length = 8;
                            end
                        else
                            if (code(8)=='0')
                                runsize = '71'; %11111010
                                code_length = 8;
                            else
                                if (code(9)=='0')
                                    runsize = '14'; %111110110
                                    code_length = 9;
                                else
                                    runsize = '32'; %111110111
                                    code_length = 9;
                                end
                            end
                        end
                    else
                        if (code(7)=='0')
                            if (code(8)=='0')
                                if (code(9)=='0')
                                    runsize = '81'; %111111000
                                    code_length = 9;
                                else
                                    runsize = '91'; %111111001
                                    code_length = 9;
                                end
                            else
                                if (code(9)=='0')
                                    runsize = 'A1'; %111111010
                                    code_length = 9;
                                else
                                    if (code(10)=='0')
                                        runsize = '08'; %1111110110
                                        code_length = 10;
                                    else
                                        runsize = '23'; %1111110111
                                        code_length = 10;
                                    end
                                end
                            end
                        else
                            if (code(8)=='0')
                                if (code(9)=='0')
                                    if (code(10)=='0')
                                        runsize = '42'; %1111111000
                                        code_length = 10;
                                    else
                                        runsize = 'B1'; %1111111001
                                        code_length = 10;
                                    end
                                else
                                    if (code(10)=='0')
                                        runsize = 'C1'; %1111111010
                                        code_length = 10;
                                    else
                                        if (code(11)=='0')
                                            runsize = '15'; %11111110110
                                            code_length = 11;
                                        else
                                            runsize = '52'; %11111110111
                                            code_length = 11;
                                        end
                                    end
                                end
                                
                            else
                                if (code(9)=='0')
                                    if (code(10)=='0')
                                        if (code(11)=='0')
                                            runsize = 'D1'; %11111111000
                                            code_length = 11;
                                        else
                                            runsize = 'F0'; %11111111001
                                            code_length = 11;
                                        end
                                    else
                                        if (code(11)=='0')
                                            if (code(12)=='0')
                                                runsize = '24'; %111111110100
                                                code_length = 12;
                                            else
                                                runsize = '33'; %111111110101
                                                code_length = 12;
                                            end
                                        else
                                            if (code(12)=='0')
                                                runsize = '62'; %111111110110
                                                code_length = 12;
                                            else
                                                runsize = '72'; %111111110111
                                                code_length = 12;
                                            end
                                        end
                                    end
                                else %111111111 ( 9 uns )
                                    if (code(10)=='0')
                                        if (code(11)=='0')
                                            if (code(12)=='0')
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            runsize = '82'; %111111111000000
                                                            code_length = 15;
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '09'; %1111111110000010
                                                                code_length = 16;
                                                            else
                                                                runsize = '0A'; %1111111110000011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '16'; %1111111110000100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '17'; %1111111110000101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '18'; %1111111110000110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '19'; %1111111110000111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '1A'; %1111111110001000
                                                                code_length = 16;
                                                            else
                                                                runsize = '25'; %1111111110001001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '26'; %1111111110001010
                                                                code_length = 16;
                                                            else
                                                                runsize = '27'; %1111111110001011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '28'; %1111111110001100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '29'; %1111111110001101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '2A'; %1111111110001110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '34'; %1111111110001111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            else %12 = 1
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '35'; %1111111110010000
                                                                code_length = 16;
                                                            else
                                                                runsize = '36'; %1111111110010001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '37'; %1111111110010010
                                                                code_length = 16;
                                                            else
                                                                runsize = '38'; %1111111110010011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '39'; %1111111110010100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '3A'; %1111111110010101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '43'; %1111111110010110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '44'; %1111111110010111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '45'; %1111111110011000
                                                                code_length = 16;
                                                            else
                                                                runsize = '46'; %1111111110011001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '47'; %1111111110011010
                                                                code_length = 16;
                                                            else
                                                                runsize = '48'; %1111111110011011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '49'; %1111111110011100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '4A'; %1111111110011101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '53'; %1111111110011110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '54'; %1111111110011111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            end
                                        else %11 = 1
                                            if (code(12)=='0')
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '55'; %1111111110100000
                                                                code_length = 16;
                                                            else
                                                                runsize = '56'; %1111111110100001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '57'; %1111111110100010
                                                                code_length = 16;
                                                            else
                                                                runsize = '58'; %1111111110100011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '59'; %1111111110100100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '5A'; %1111111110100101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '63'; %1111111110100110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '64'; %1111111110100111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '65'; %1111111110101000
                                                                code_length = 16;
                                                            else
                                                                runsize = '66'; %1111111110101001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '67'; %1111111110101010
                                                                code_length = 16;
                                                            else
                                                                runsize = '68'; %1111111110101011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '69'; %1111111110101100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '6A'; %1111111110101101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '73'; %1111111110101110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '74'; %1111111110101111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            else %12 = 1
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '75'; %1111111110110000
                                                                code_length = 16;
                                                            else
                                                                runsize = '76'; %1111111110110001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '77'; %1111111110110010
                                                                code_length = 16;
                                                            else
                                                                runsize = '78'; %1111111110110011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '79'; %1111111110110100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '7A'; %1111111110110101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '83'; %1111111110110110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '84'; %1111111110110111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '85'; %1111111110111000
                                                                code_length = 16;
                                                            else
                                                                runsize = '86'; %1111111110111001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '87'; %1111111110111010
                                                                code_length = 16;
                                                            else
                                                                runsize = '88'; %1111111110111011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '89'; %1111111110111100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '8A'; %1111111110111101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '92'; %1111111110111110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '93'; %1111111110111111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            end
                                        end
                                    else %10 = 1
                                        if (code(11)=='0')
                                            if (code(12)=='0')
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '94'; %1111111111000000
                                                                code_length = 16;
                                                            else
                                                                runsize = '95'; %1111111111000001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = '96'; %1111111111000010
                                                                code_length = 16;
                                                            else
                                                                runsize = '97'; %1111111111000011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = '98'; %1111111111000100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = '99'; %1111111111000101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = '9A'; %1111111111000110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'A2'; %1111111111000111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'A3'; %1111111111001000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'A4'; %1111111111001001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'A5'; %1111111111001010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'A6'; %1111111111001011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'A7'; %1111111111001100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'A8'; %1111111111001101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'A9'; %1111111111001110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'AA'; %1111111111001111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            else %12 = 1
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'B2'; %1111111111010000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'B3'; %1111111111010001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'B4'; %1111111111010010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'B5'; %1111111111010011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'B6'; %1111111111010100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'B7'; %1111111111010101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'B8'; %1111111111010110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'B9'; %1111111111010111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'BA'; %1111111111011000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'C2'; %1111111111011001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'C3'; %1111111111011010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'C4'; %1111111111011011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'C5'; %1111111111011100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'C6'; %1111111111011101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'C7'; %1111111111011110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'C8'; %1111111111011111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            end
                                        else %11 = 1
                                            if (code(12)=='0')
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'C9'; %1111111111100000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'CA'; %1111111111100001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'D2'; %1111111111100010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'D3'; %1111111111100011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'D4'; %1111111111100100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'D5'; %1111111111100101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'D6'; %1111111111100110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'D7'; %1111111111100111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'D8'; %1111111111101000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'D9'; %1111111111101001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'DA'; %1111111111101010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'E1'; %1111111111101011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'E2'; %1111111111101100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'E3'; %1111111111101101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'E4'; %1111111111101110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'E5'; %1111111111101111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            else %12 = 1
                                                if (code(13)=='0')
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'E6'; %1111111111110000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'E7'; %1111111111110001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'E8'; %1111111111110010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'E9'; %1111111111110011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'EA'; %1111111111110100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'F1'; %1111111111110101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'F2'; %1111111111110110
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'F3'; %1111111111110111
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                else %13 = 1
                                                    if (code(14)=='0')
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'F4'; %1111111111111000
                                                                code_length = 16;
                                                            else
                                                                runsize = 'F5'; %1111111111111001
                                                                code_length = 16;
                                                            end
                                                        else
                                                            if (code(16)=='0')
                                                                runsize = 'F6'; %1111111111111010
                                                                code_length = 16;
                                                            else
                                                                runsize = 'F7'; %1111111111111011
                                                                code_length = 16;
                                                            end
                                                        end
                                                    else %14 = 1
                                                        if (code(15)=='0')
                                                            if (code(16)=='0')
                                                                runsize = 'F8'; %1111111111111100
                                                                code_length = 16;
                                                            else %16 = 1
                                                                runsize = 'F9'; %1111111111111101
                                                                code_length = 16;
                                                            end
                                                        else %15 = 1
                                                            if (code(16)=='0')
                                                                runsize = 'FA'; %1111111111111110
                                                                code_length = 16;
                                                            end
                                                        end
                                                        
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
end