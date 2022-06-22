clear all;
close all;
clc;
data=[200 7.0 0.008 10 85 0.000218;180 6.3 0.009 10 80 0.000228;140 608 0.007 10 70 0.000179;];
const=data(:,1);
beta=data(:,2);
gamma=data(:,3);
pmin=data(:,4);
pmax=data(:,5);
ploss=data(:,6);
lambda=input('Enter the assumed value of lambda: \n');
p=zero(3,1);
loss=0;
demand=input('enter the demand: \n');
deltap=1;
iteration=0;
while abs(deltap)>.001
    iteration=iteration+1;
for i=1:3
    p(i)=(lambda-beta(i))/(2*{gamma(i)+lambda*ploss(i)});
    loss=loss+ploss(i)*p(i)^2;
    loss1=loss;
end
deltap=demand+loss-sum(p);
loss=0;
if abs(deltap)>0
    k=0;
    for i=1:3
        k=k+(gamma(i)+ploss(i)*beta(i))/(2*{gamma(i)+lambda*ploss(i)}^2);
    end
end
detlalambda=deltap/k;
lambda=lambda+deltalambda;
end
cost=0;
for i=1:3
    cost=cost+(const(i)+(beta(i)*p(i))+(gamma(i)*p(i)*p(i)));
end
disp('The optimal valve of generating units area: ');
disp(p);
disp('The power loss of the system is: ');
disp(loss1);
disp('The number of iteration taken to achieve optimum value are: ');
disp(iteration);
disp('The value of lambda for which optimum value is achieved is: ');
disp(lambda);
disp('The total cost of the system is: ');
disp(cost);



