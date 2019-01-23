function oneneuron(z,x1,x2)

disp('Enter weights');
w1=input('Weight w1=');
w2=input('Weight w2=');
disp('Enter Threshold Value');
theta=input('Theta=');
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
      w2=input('Weight w2=');
      theta=input('Theta=');
  end
end

fprintf('\nWeights of Neuron Z: w1=%d w2=%d',w1,w2);
fprintf('\nThreshold value:%d\n',theta);

end