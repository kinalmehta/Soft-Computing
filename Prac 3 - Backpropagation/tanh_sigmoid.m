function [ y ] = tanh_sigmoid( x )

y=(1-exp(-2*x))/(1+exp(-2*x));

end