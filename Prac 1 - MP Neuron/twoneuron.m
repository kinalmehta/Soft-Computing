function twoneuron(z,x1,x2)

disp('Enter weights');
w11=input('Weight w11=');
w12=input('Weight w12=');
w21=input('Weight w21=');
w22=input('Weight w22=');
v1=input('Weight v1=');
v2=input('Weight v2=');
disp('Enter Threshold Value');
theta=input('Theta=');

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
      w12=input('Weight w12=');
      w21=input('Weight w21=');
      w22=input('Weight w22=');
      v1=input('Weight v1=');
      v2=input('Weight v2=');
      theta=input('Theta=');
  end
end

fprintf('\nWeights of Neuron Z1: w11=%d w21=%d',w11,w21);
fprintf('\nWeights of Neuron Z2: w12=%d w22=%d',w12,w22);
fprintf('\nWeights of Neuron Y: v1=%d v2=%d',v1,v2);
fprintf('\nThreshold value:%d\n',theta);

end