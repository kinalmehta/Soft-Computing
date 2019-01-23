function [ y ] = triangular_func( u,a,b,g )

if u<=a
    y=0;
elseif ((u>a)&&(u<=b))
    y=((u-a)/(b-a));
elseif ((u>b)&&(u<=g))
    y=((g-u)/(g-b));
elseif u>g
    y=0;
end

end