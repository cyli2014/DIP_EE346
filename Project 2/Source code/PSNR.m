function [y] = PSNR(x0, x1)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
s = 0;
pheight = size(x0, 1);
pwidth = size(x0, 2);
for i = 1:pheight
    for j = 1:pwidth
        s = s + double(x0(i,j) - x1(i,j))^2;
    end
end

if s == 0
    y = +Inf;
else
    y = 10*log10(double(65025*pheight*pwidth/s));
end
end