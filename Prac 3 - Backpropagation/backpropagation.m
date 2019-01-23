clc;
close all;
clear all;

x=[-1 -1; -1 1; 1 -1; 1 1];
t=[-1 -1 -1 1;1 -1 1 -1;1 -1 1 -1;1 1 -1 1];
%x=[0 0;0 1;1 0;1 1];
%t=[0 0 0 1;1 0 1 0;1 0 1 0;1 1 0 1];


[r1,c1]=size(x);%dimentions of input data
[r2,c2]=size(t);%dimentions of output data

%hidden_neurons=input('Enter the number of hidden layer neurons:');
hidden_neurons=3;

%Step 0:Initialize Weights to random Values
%In range:[-0.5 0.5]
v=randi([0,1],c1,hidden_neurons)-0.5;
v0=randi([0,1],1,hidden_neurons)-0.5;
w=randi([0,1],hidden_neurons,c2)-0.5;
w0=randi([0,1],1,c2)-0.5;


itr=1; %for counting number of iterations
alpha=0.1;
msef=1;
while (itr<=3000 && msef>0.00001)

    for p=1:r1
        
       mse=zeros(c2);
       %Forward Phase
       z_in=v0;
       for q=1:hidden_neurons
           for r=1:c1
               z_in(q)=z_in(q)+x(p,r)*v(r,q);
           end
       end
       z=zeros(hidden_neurons);
       for q=1:hidden_neurons
           z(q)=bipolar_sigmoid(z_in(q));
       end
       
       y_in=w0;
       for q=1:c2
           for r=1:hidden_neurons
               y_in(q)=y_in(q)+z(r)*w(r,q);
           end
       end
       y=zeros(c2);
       for q=1:c2
           y(q)=bipolar_sigmoid(y_in(q));
       end
       %Backpropagation Phase
       del=zeros(c2);
       for k=1:c2
           del(k)=(t(p,k)-y(k))*bipolar_sigmoid_derivative(y_in(k));
       end
       delta_w=zeros(hidden_neurons,c2);
       delta_w0=zeros(1,c2);
       for k=1:c2
           for j=1:hidden_neurons
               delta_w(j,k)=alpha*del(k)*z(j);
           end
           delta_w0(k)=alpha*del(k);
       end
       del2_in=zeros(hidden_neurons);
       del2=zeros(hidden_neurons);
       for j=1:hidden_neurons
           for k=1:c2
               del2_in(j)=del2_in(j)+del(k)*w(j,k);
           end
       end
       for j=1:hidden_neurons
           del2(j)=del2_in(j)*bipolar_sigmoid_derivative(z_in(j));
       end
       delta_v=zeros(c1,hidden_neurons);
       delta_v0=zeros(1,hidden_neurons);
       for j=1:hidden_neurons
           for i=1:c1
               delta_v(i,j)=alpha*del2(j)*x(p,i);
           end
           delta_v0(j)=alpha*del2(j);
       end
       %Updating Weights
       for k=1:c2
           for j=1:hidden_neurons
               w(j,k)=w(j,k)+delta_w(j,k);
           end
           w0(k)=w0(k)+delta_w0(k);
       end
       for j=1:hidden_neurons
           for i=1:c1
               v(i,j)=v(i,j)+delta_v(i,j);
           end
           v0(j)=v0(j)+delta_v0(j);
       end
       %Calculating mse
       for k=1:c2
           mse(k)=mse(k)+((t(p,k)-y(k))^2);
       end
       
    end
    mse=mse*0.125;
    msef=0;
    for k=1:c2
        msef=msef+mse(k);
        %plot(itr,mse(k),'.y');hold on;drawnow;
    end
    msef=msef/c2;
    if mod(itr,100)==0
        plot(itr,msef,'.b');hold on;drawnow;
    end
    itr=itr+1;
    
end



%Verification
for p=1:r1
       z_in=v0;
       for q=1:hidden_neurons
           for r=1:c1
               z_in(q)=z_in(q)+x(p,r)*v(r,q);
           end
       end
       z=zeros(hidden_neurons);
       for q=1:hidden_neurons
           z(q)=bipolar_sigmoid(z_in(q));
       end
       
       y_in=w0;
       for q=1:c2
           for r=1:hidden_neurons
               y_in(q)=y_in(q)+z(r)*w(r,q);
           end
       end
       y=t;
       for q=1:c2
           y(p,q)=bipolar_sigmoid(y_in(q));
       end              
end
disp(msef);
disp(y);