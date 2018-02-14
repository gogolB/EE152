%% Problem 6 Part A
M = eye(4);
F = fft2(M);

% Row wise FFT
R = [fft(M(1,:));fft(M(2,:));fft(M(3,:));fft(M(4,:))];
% Column wise FFT
F2 = [fft(R(:,1)) fft(R(:,2)) fft(R(:,3)) fft(R(:,4))];

% Difference
result = F - F2
%% Problem 6 Part B
M = eye(4);
D = dct2(M);

% Row wise dct
R = [dct(M(1,:));dct(M(2,:));dct(M(3,:));dct(M(4,:))];
% Column wise dct
D2 = [dct(R(:,1)) dct(R(:,2)) dct(R(:,3)) dct(R(:,4))];

% Difference
result = D - D2
