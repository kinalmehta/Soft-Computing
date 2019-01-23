function [ y ] = sigmoidal_func( u,a,c )

y=1/(1+exp(-a*(u-c)));

end