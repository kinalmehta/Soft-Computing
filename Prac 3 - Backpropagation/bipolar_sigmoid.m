function [ y ] = bipolar_sigmoid( x )

y=(2/(1+exp(-x)))-1;

end