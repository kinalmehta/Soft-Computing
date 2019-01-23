function [ centroids ] = k_means_clustering( x, cluster )

%plot(x(:,1),x(:,2),'ob');

[maxRow,maxCol]=size(x);

centroids=ones(cluster,maxCol);

for i=1:cluster
    centroids(i,:)=x(i,:);
end
%disp(centroids);
old_centroids=zeros(cluster,maxCol);

while ~isequal(centroids,old_centroids)
    
    dist=zeros(maxRow,cluster);
    for i=1:cluster
        for k=1:maxRow
            for j=1:maxCol
                dist(k,i)=dist(k,i)+(centroids(i,j)-x(k,j))^2;
            end
        end
    end
    dist=sqrt(dist);
    %disp(dist);
    nearest=zeros(maxRow,1);
    for i=1:maxRow
        nearest(i)=1;
        for j=1:cluster-1
            if dist(i,nearest(i))>dist(i,j+1)
                nearest(i)=j+1;
            end
        end
    end
    %disp(nearest);
    
    cluster_assignment=zeros(maxRow,cluster);
    for i=1:maxRow
        cluster_assignment(i,nearest(i))=1;
    end
    %disp(cluster_assignment);
    
    old_centroids=centroids;
    
    centroids=zeros(cluster,maxCol);
    for i=1:cluster
        l=0;
        for j=1:maxRow
            if cluster_assignment(j,i)==1
                l=l+1;
                for k=1:maxCol
                    centroids(i,k)=centroids(i,k)+x(j,k);
                end
            end
        end
        centroids(i,:)=centroids(i,:)/l;
    end
    %disp(centroids);
end

end

