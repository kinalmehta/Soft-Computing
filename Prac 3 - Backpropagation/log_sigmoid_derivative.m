function [ y ] = log_sigmoid_derivative( x )

y=log_sigmoid(x)*(1-log_sigmoid(x));

end