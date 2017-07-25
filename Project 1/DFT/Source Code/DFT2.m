function y = DFT2(x)
    x = double(x);
    height = size(x,1);
    width = size(x,2);
    U = zeros(height, height);
    V = zeros(width, width);
    for j = 1 : height
        for k = 1 : height
            U(j, k) = exp(-2*pi*(j-1)*(k-1)/height*1i);
        end
    end
    U = U / sqrt(height);
    for j = 1 : width
        for k = 1 : width
            V(j, k) = exp(-2*pi*(j-1)*(k-1)/width*1i);
        end
    end
    V = V / sqrt(width);
    
    y = U*x*V;
    