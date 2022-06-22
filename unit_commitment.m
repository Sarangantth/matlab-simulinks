clc;
clear all;
h=[0.00142 7.2 510;0.00194 7.85 310;0.00482 7.97 78];
k=[1.1 1.0 1.2];
plower=[150 100 50];
pupper=[600 400 200];
pd=750;
n=length(plower);
disp('Fuel Cost Equation: F(p)=')
for i=1:n
    cost(i,:)=h(i,:)*k(1,i);
    a(i,1)=cost(i,1);
    b(i,1)=cost(i,2);
    c(i,1)=cost(i,3);
end
disp(cost)
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
disp('Full load average cost=')
for i=1:n
 fla(i,1)=(a(i,1)*pupper(1,i)^2+b(i,1)*pupper(1,i)+c(i,1))/pupper(1,i);
 disp(fla(i,1));
end
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
p=fla;
p(:,2)=plower';
p(:,3)=pupper';
p=sortrows(p)
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
p(1,4)=p(1,2)
p(1,5)=p(1,3)
for i=1:n-1
 p(i+1,4)=p(i+1,2)+p(i,4);
 p(i+1,5)=p(i+1,3)+p(i,5);
end
p
disp('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
for i=1:n
 if pd>=p(i,5)
    p(i,6)=p(i,3);
 end
 if pd<p(i,5)
    g=0;
    for j=1:i-1
         g=g+p(j,3);
    end
    p(i,6)=pd-g;
 end
end
for i=1:n
 if p(i,6)<0
    p(i,6)=0;
 end
end
g=p(:,6)
cost=sum([sum(a.*g.*g) sum(b.*g) sum(c)]);
cost
