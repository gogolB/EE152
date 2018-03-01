function H = dsft_1(h,w)
    H = 0;
    for i = 1:length(h)
        H = H + h(i)*exp(-1i * 2*pi*w);
    end
end
