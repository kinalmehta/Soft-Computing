clc;
clear all;
close all;

i=input('Select function to implement:\n1.Triangular\n2.Sigmoidal\n3.Trapezoidal\n4.Gaussian\n5.Generalized Bell:');
y=zeros(1,100);
switch i
    case 1
        a=input('Enter a,b,g:');
        for u=1:100
            y(u)=triangular_func( u,a(1),a(2),a(3) );
        end
        plot(1:100,y);
    case 2
        a=input('Enter a,c:');
        for u=1:100
            y(u)=sigmoidal_func( u,a(1),a(2) );
        end
        plot(1:100,y);
    case 3
        a=input('Enter a,b,g,d:');
        for u=1:100
            y(u)=trapezoidal_func( u,a(1),a(2),a(3),a(4) );
        end
        plot(1:100,y);
    case 4
        a=input('Enter m,d:');
        for u=1:100
            y(u)=gaussian_func( u,a(1),a(2) );
        end
        u=1:100;
        plot(u,y);
    case 5
        a=input('Enter a,b,c:');
        for u=1:100
            y(u)=generalized_bell_func( u,a(1),a(2),a(3) );
        end
        plot(1:100,y);
        
end
