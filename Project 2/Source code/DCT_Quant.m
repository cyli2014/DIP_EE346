function y = DCT_Quant(x,g)
A = zeros(8);
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
x = double(x);
x = A*x*A';
Quant_matrix =	 [16 11 10 16 24 40 51 61
                  12 12 14 19 26 58 60 55
                  14 13 16 24 40 57 69 56
                  14 17 22 29 51 87 80 62
                  18 22 37 56 68 109 103 77
                  24 35 55 64 81 104 113 92
                  49 64 78 87 103 121 120 101
                  72 92 95 98 112 100 103 99];
Quant_matrix = g.*Quant_matrix;
y = round(x./Quant_matrix);
end