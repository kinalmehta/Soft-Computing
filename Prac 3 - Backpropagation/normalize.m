function [ y, amp, off ] = normalize( x )

amp=(x(length(x))-x(1))/(max(x)-min(x));
off=x(length(x))-amp*max(x);
y=amp*x+off;

end

