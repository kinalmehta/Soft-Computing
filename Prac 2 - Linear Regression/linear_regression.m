clc;
close all;
clear all;

m=2;
c=4;

x=-10:2:10;
y=m*x+c+randn(1,length(x));

plot(x,y,'o');hold on;drawnow;
ep=1;

w0=1;
w1=1;
eta=0.01;

[xn, ampx, offx]=normalize(x);
[yn, ampy, offy]=normalize(y);

while (ep<1000)
        
    for i=1:1:length(y)
        yo=w1*x(i)+w0;
        dwo=eta*(yn(i)-yo)*xn(i);
        dwb=eta*(yn(i)-yo);
    
        w0=w0+dwb;
        w1=w1+dwo;
    end
    ep=ep+1;
    
    %x=denormalize(xn, ampx, offx);
    %y=denormalize(yn, ampy, offy);
    %plot(x,w1*x+w0,'g');hold on;drawnow;
end

plot(x,w1*x+w0,'r')