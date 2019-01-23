clc;
clear all;
close all;

x=[0 0; 0 1; 1 0; 1 1];
t=[0; 1; 1; 0];

centroids=[-2 -2;3 3];

r=zeros(4,2);
phi=zeros(4,2);

for i=1:4
    r(i,1)=sqrt( (centroids(1,1)-x(i,1))^2 + (centroids(1,2)-x(i,2))^2 );
    r(i,2)=sqrt( (centroids(2,1)-x(i,1))^2 + (centroids(2,2)-x(i,2))^2 );
end

for i=1:4
    for j=1:2
        phi(i,j)=exp(-1*(r(i,j))^2);
    end
end
%disp(phi);
phi(:,3)=1;
x=pinv(phi);
w=x*t;

op=phi*w;

disp('Weights:')
disp(w);
disp('Output of RBFN');
disp(op);