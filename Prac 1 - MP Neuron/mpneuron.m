clc;
close all;

%Getting weights and threshold value
fprintf('\nEnter choice for gate to be implemented:\n1.AND\n2.XOR\n3.OR\n4.NOR\n5.NAND\n6.AND-NOT\n')
option=input('Enter the option:');
x1=[0 0 1 1];
x2=[0 1 0 1];

switch option
    
    case 1
        
z=[0 0 0 1];
disp('McCulloch-Pitts Net for AND function');
oneneuron(z,x1,x2)


    case 2
        
z=[0 1 1 0];
disp('McCulloch-Pitts Net for XOR function');
twoneuron(z,x1,x2)

    case 3
        
z=[0 1 1 1];
disp('McCulloch-Pitts Net for OR function');
oneneuron(z,x1,x2)

    case 4
        
z=[1 0 0 0];
disp('McCulloch-Pitts Net for NOR function');
oneneuron(z,x1,x2)

    case 5
        
z=[1 1 1 0];
disp('McCulloch-Pitts Net for NAND function');
oneneuron(z,x1,x2)

    case 6
        
z=[0 0 1 0];
disp('McCulloch-Pitts Net for AND-NOT function');
twoneuron(z,x1,x2)

end