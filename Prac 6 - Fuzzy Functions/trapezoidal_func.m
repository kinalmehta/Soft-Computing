function [ y ] = trapezoidal_func( u,a,b,g,d )

if u<=a
    y=0;
elseif ((u>a)&&(u<=b))
    y=((u-a)/(b-a));
elseif ((u>b)&&(u<=g))
    y=1;
elseif ((u>g)&&(u<=d))
    y=((d-u)/(d-g));
elseif u>d
    y=0;
end

end