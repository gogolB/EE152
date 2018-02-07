% High boost filtering function
% By Yanchao Wang
% https://www.mathworks.com/matlabcentral/fileexchange/53263-highboost-i--a-?focused=5494782&tab=function

function [J0 J1] = Highboost(I, A)
% high boost filtering
% I is input image
% A is parameter

A = double(A);
if A < 1
    error('Unavailable Value of A');
end

f = double(I);
[m n]=size(f);
J0 = f;
for i=3:m-2
    for j=3:n-2
        J0(i,j) = (-8*f(i,j))+(1*f(i-1,j))+(1*f(i+1,j))+(1*f(i,j-1))+(1*f(i,j+1))...
    +(1*f(i-1,j-1))+(1*f(i+1,j+1))+(1*f(i-1,j+1))+(1*f(i+1,j-1)); 
    end
end
%Laplacian filter

%
% uint8_J0 = uint8(J0);
% uint8_I1 = uint8(f) .* (A-1);
% J1 = uint8_J0 + uint8_I1;
%
I1 = f .* (A-1);
J1  = J0 + I1;

end