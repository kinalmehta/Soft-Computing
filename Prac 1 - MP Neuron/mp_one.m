clc;
clear all;
close all;

%Getting weights and threshold value
disp(sprintf('Enter choice for gate to be implemented:\n1.AND 2.XOR 3.OR 4.NOR 5.NAND'))
option=input('Enter the option:');
x1=[0 0 1 1];
x2=[0 1 0 1];
y =[0 0 0 0];
y1=[0 0 0 0];
y2=[0 0 0 0];
switch option
    
    case 1
disp('Enter weights');
w1=input('Weight w1=');
w2=input('Weight w2=');
disp('Enter Threshold Value');
theta=input('theta=');
z=[0 0 0 1];

con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
      if zin(i)>=theta
          y(i)=1;
      else
          y(i)=0;
      end     
  end
  
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      w1=input('Weight w1=');
      w2=input('weight w2=');
      theta=input('theta=');
  end
end
disp('McCulloch-Pitts Net for AND function');
disp('Weights of Neuron Z');
disp(w1);
disp(w2);
disp('Threshold value');
disp(theta);


    case 2
        
disp('Enter weights');
w11=input('Weight w11=');
w12=input('weight w12=');
w21=input('Weight w21=');
w22=input('weight w22=');
v1=input('weight v1=');
v2=input('weight v2=');
disp('Enter Threshold Value');
theta=input('theta=');
z=[0 1 1 0];
con=1;
while con
  zin1=x1*w11+x2*w21;
  zin2=x1*w21+x2*w22;
  for i=1:4
      if zin1(i)>=theta
          y1(i)=1;
      else
          y1(i)=0;
      end     
      if zin2(i)>=theta
          y2(i)=1;
      else
          y2(i)=0;
      end
  end
  yin=y1*v1+y2*v2;
  for i=1:4
      if yin(i)>=theta;
          y(i)=1;
      else
          y(i)=0;
      end
  end
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      w11=input('Weight w11=');
      w12=input('weight w12=');
      w21=input('Weight w21=');
      w22=input('weight w22=');
      v1=input('weight v1=');
      v2=input('weight v2=');
      theta=input('theta=');
  end
end
disp('McCulloch-Pitts Net for XOR function');
disp('Weights of Neuron Z1');
disp(w11);
disp(w21);
disp('weights of Neuron Z2');
disp(w12);
disp(w22);
disp('weights of Neuron Y');
disp(v1);
disp(v2);
disp('Threshold value');
disp(theta);


    case 3
        
disp('Enter weights');
w1=input('Weight w1=');
w2=input('Weight w2=');
disp('Enter Threshold Value');
theta=input('theta=');
z=[0 1 1 1];
con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
      if zin(i)>=theta
          y(i)=1;
      else
          y(i)=0;
      end     
  end
  
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      w1=input('Weight w1=');
      w2=input('weight w2=');
      theta=input('theta=');
  end
end
disp('McCulloch-Pitts Net for OR function');
disp('Weights of Neuron Z');
disp(w1);
disp(w2);
disp('Threshold value');
disp(theta);

    case 4
        
disp('Enter weights');
w1=input('Weight w1=');
w2=input('Weight w2=');
disp('Enter Threshold Value');
theta=input('theta=');
z=[1 0 0 0];
con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
      if zin(i)>=theta
          y(i)=1;
      else
          y(i)=0;
      end     
  end
  
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      w1=input('Weight w1=');
      w2=input('weight w2=');
      theta=input('theta=');
  end
end
disp('McCulloch-Pitts Net for NOR function');
disp('Weights of Neuron Z');
disp(w1);
disp(w2);
disp('Threshold value');
disp(theta);

    case 5
        
disp('Enter weights');
w1=input('Weight w1=');
w2=input('Weight w2=');
disp('Enter Threshold Value');
theta=input('theta=');
z=[1 1 1 0];
con=1;
while con
  zin=x1*w1+x2*w2;
  for i=1:4
      if zin(i)>=theta
          y(i)=1;
      else
          y(i)=0;
      end     
  end
  
  disp('Output of Net');
  disp(y);
  if y==z
      con=0;
  else
      disp('Net is not learning enter another set of weights and Threshold value');
      w1=input('Weight w1=');
      w2=input('weight w2=');
      theta=input('theta=');
  end
end
disp('McCulloch-Pitts Net for NAND function');
disp('Weights of Neuron Z');
disp(w1);
disp(w2);
disp('Threshold value');
disp(theta);


end
