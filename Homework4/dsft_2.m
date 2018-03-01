function H = dsft_2(h,wm,wn)
    H = 0;
    for i = 1:size(h,1)
        for j = 1:size(h,2)
            H = H + h(i,j) * exp(-1i*2*pi*(wm*i+wn*j));
        end
    end
end
