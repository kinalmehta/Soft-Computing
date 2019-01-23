clc;
close all;

x1=[0 0 1 1];
x2=[0 1 0 1];

w11=[-1 0 1];
w22=[-1 0 1];

for i=1:3
    for j=1:3
        zin=x1*w11(i)+x2*w22(j);
        fprintf('\nFor weights w1:%d w2:%d',w11(i),w22(j));
        fprintf('\nO/P is : ');
        disp(zin)
    end
end

disp(zin)


