clc;
clear all;
close all;


pattern=[1.1 1.7 1.8;0 0 0;0 0.5 1.5;1 0 0;0.5 0.5 0.5;1 1 1];
[row1, column1] = size(pattern);
w = [0.4 0.6 0.2;0.1 0.1 0.5;0.5 0.5 0.5];
[row2, column2] = size(w);

iter=10;
eta=0.5;
D=1;


topology=[2 1 3];
epochs=100;



for k=1:epochs
    for i=1:row1
        for j=1:row2
            ed(j)=sum((w(j,:)-pattern(i,:)).^2);
        end
        winner= find(ed==min(ed));
        
        index= find(topology==winner(1));
        lower_lim= index - D;
        higher_lim= index - D;
        
        if lower_lim<1
            lower_lim=1;
        end
        
        if higher_lim>length(topology)
            higher_lim=length(topology);
        end
        
        delta = topology(lower_lim:higher_lim);
        
        for j=delta
            delta_w= eta*(pattern(i,:)-w(j,:));
            w(j,:)=w(j,:)+delta_w;
        end
        
        
        cluster(i)=winner(1);
    end
end

disp('Final Weight Matrix:');
disp(w);
disp('         input pattern            clusters');
disp([pattern cluster.']);

scatter3(pattern(2,1),pattern(2,2),pattern(2,3),'ob');hold on;
scatter3(pattern(4,1),pattern(4,2),pattern(4,3),'ob');hold on;

scatter3(pattern(1,1),pattern(1,2),pattern(1,3),'.k');hold on;
scatter3(pattern(3,1),pattern(3,2),pattern(3,3),'.k');hold on;

scatter3(pattern(5,1),pattern(5,2),pattern(5,3),'*r');hold on;
scatter3(pattern(6,1),pattern(6,2),pattern(6,3),'*r');hold on;