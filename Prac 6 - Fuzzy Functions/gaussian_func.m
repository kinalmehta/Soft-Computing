function [ y ] = gaussian_func( u,m,d )

y=exp(-1*(u-m)^2/(2*d^2));

end