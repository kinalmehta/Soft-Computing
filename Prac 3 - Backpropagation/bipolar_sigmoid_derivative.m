function [ y ] = bipolar_sigmoid_derivative( x )

y=(1+bipolar_sigmoid(x))*(1-bipolar_sigmoid(x))/2;

end