clc;
clear all;
close all;

x=[0 0; 0 1; 1 0; 1 1];
t=[0; 1; 1; 0];

total_centroids=2;
centroids = k_means_clustering(x,total_centroids);;

[maxRow, maxCol]=size(x);

r=zeros(maxRow,total_centroids);
phi=zeros(maxRow,total_centroids);

for i=1:maxRow
    for j=1:total_centroids
        for k=1:maxCol
            r(i,j)=r(i,j)+(centroids(j,k)-x(i,k))^2;
        end
    end
end
r=sqrt(r);

for i=1:maxRow
    for j=1:maxCol
        phi(i,j)=exp(-1*(r(i,j))^2);
    end
end

disp(phi);

phi(:,maxCol+1)=1;

x=pinv(phi);
w=x*t;

op=phi*w;

disp('Weights:')
disp(w);
disp('Output of RBFN');
disp(op);
