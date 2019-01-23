clc;
close all;
clear all;

%Step 0:Initialize Weights to random Values
%In range:[-0.5 0.5]
x=[-1 -1; -1 1; 1 -1; 1 1];
t=[-1 1 1 -1];
%[r1,c1]=size(x);

v=randi([0,1],2,5)-0.5;
v0=randi([0,1],1,5)-0.5;
w=randi([0,1],5,1)-0.5;
w0=randi([0,1],1,1)-0.5;


itr=1; %for counting number of iterations
alpha=0.1;
mse=1;
while (itr<=3000 && mse>0.0002)
   
   for m=1:4
       mse=0;
       %z_in1=x(i)*v(i,1);
       z_in=v0;
       for j=1:5
          
           z_in(j)=z_in(j)+x(m,1)*v(1,j)+x(m,2)*v(2,j);
                      
       end
       z=[0 0 0 0 0];
       for j=1:5
          
           z(j)=bipolar_sigmoid(z_in(j));
           
       end
       y_in=w0;
       for j=1:5
          
           y_in=y_in+z(j)*w(j);
                      
       end
       y=bipolar_sigmoid(y_in);
       
       %Step 6:Finfing delk
       del_k_2=(t(m)-y)*bipolar_sigmoid_derivative(y_in);
       delta_w_k=[0 0 0 0 0];
       for j=1:5
           delta_w_k(j)=alpha*del_k_2*z(j);
       end
       delta_w_k_0=alpha*del_k_2;
       
       del_in_j=[0 0 0 0 0];
       del_j=[0 0 0 0 0];
       delta_v=zeros(size(v));
       delta_v_j_0=v0;
       for j=1:5
           del_in_j(j)=del_k_2*w(j);
           del_j(j)=del_in_j(j)*bipolar_sigmoid_derivative(z_in(j)); 
           
           delta_v(1,j)=alpha*del_j(j)*x(m,1);
           delta_v(2,j)=alpha*del_j(j)*x(m,2);
           delta_v_j_0(j)=alpha*del_j(j);       
       end
       
       %updating the weights
       for j=1:5
           w(j)=w(j)+delta_w_k(j); 
           v(1,j)=v(1,j)+delta_v(1,j);
           v(2,j)=v(2,j)+delta_v(2,j);
       end
       %bias update
       w0=w0+delta_w_k_0;
       for j=1:5
           v0(j)=v0(j)+delta_v_j_0(j);
       end
       mse=mse+((t(m)-y)^2);
   end
   mse=mse*0.125;
   plot(itr,mse,'.k');hold on;drawnow;
   itr=itr+1;
end

%Verification
for m=1:4
       
       %z_in1=x(i)*v(i,1);
       z_in=v0;
       for j=1:5
          
           z_in(j)=z_in(j)+x(m,1)*v(1,j)+x(m,2)*v(2,j);
                      
       end
       z=[0 0 0 0 0];
       for j=1:5
          
           z(j)=bipolar_sigmoid(z_in(j));
           
       end
       y_in=w0;
       for j=1:5
          
           y_in=y_in+z(j)*w(j);
                      
       end
       y(m)=bipolar_sigmoid(y_in);
end
disp(mse);
disp(y);