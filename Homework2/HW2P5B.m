clear all;
close all;
clc;

x1 = 0;
x2 = 5;
y1 = 0;
y2 = 5;

q11 = [x1 y1];
q12 = [x1 y2];
q21 = [x2 y1];
q22 = [x2 y2];

f11 = 10;
f12 = -2;
f21 = 5;
f22 = 3;

x = 0:0.1:5;
y = 0:0.1:5;


for i=1:size(x,2)
    for j = i:size(y,2)
        X = [x2 - x(i) x(i) - x1];
        Y = [y2 - y(j);y(j) - y1];
        F = [f11 f12;f21 f22];
        z(i,j) = 1/((x2 - x1)*(y2-y1)) .* X*F*Y;
    end
end

surf(x, y, z);