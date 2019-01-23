function [ y ] = generalized_bell_func( x,a,b,c )

y=1/(1+((x-c)/a)^(2*b));

end