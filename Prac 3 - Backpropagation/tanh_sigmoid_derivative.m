function [ y ] = tanh_sigmoid_derivative( x )

y=1-tanh_sigmoid(x)^2;

end