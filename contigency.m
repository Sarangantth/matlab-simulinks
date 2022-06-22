clc;
clear all;
p(1)=input('Enter p1:');
p(2)=input('enter p2:');
p=[p(1);p(2)];
l12=input('Enter line reactance 1-2:');
l13=input('Enter line reactance 1-3:');
l23=input('Enter line reactance 2-3:');
b12=1/l12;b13=1/l13; b23=1/l23;
B=[b12+b13 -b12;-b12 b12+b23]
X=inv(B)
theta=X*p;
p12=(theta(1)-theta(2))*b12;
p13=theta(1)*b13;
p23=theta(2)*b23;
a121=(X(1,1)-X(2,1))*b12;
a131=X(1,1)*b13;
a231=X(2,1)*b23;
disp ('.......................................................');
disp ('For outage of generator 1:');
delp1=-p(1);
p12m=p12+a121*delp1;
p23m=p23+a231*delp1;
p13m=p13+a131*delp1;
disp ('Generator shift factor are:');
a121
a131
a231
disp ('Power flow during outage of generator 1');
fprintf('Power flow line 12 %g p.u.:\n',p12m);
fprintf('Power flow line 23 %g p.u.:\n',p23m);
fprintf('Power flow line 13 %g p.u.:\n',p13m);
disp ('.......................................................');
for i=1:3
    X(i,3)=0;
end
% Line outage of distribution factor outage of 1-3
disp ('For outage of line 1-2');
disp ('Line Outage distribution factor are:');
d1312=((l12/l13)*(X(1,1)-X(1,2)-X(3,1)+X(3,2)))/(l12-(X(1,1)+X(2,2)-
2*X(1,2)))
d2312=((l12/l23)*(X(2,1)-X(2,2)-X(3,1)+X(3,2)))/(l12-(X(1,1)+X(2,2)-
2*X(1,2)))
f13=p13+d1312*p12; f23=p23+d2312*p12;
fprintf('Power flow line 13 %g p.u.:\n',f13);
fprintf('Power flow line 23 %g p.u.:\n',f23);
disp ('.......................................................');
% Line outage of distribution factor outage of 1-3
disp ('For outage of line 1-3');
disp ('Line Outage distribution factor are:');
d1213=((l13/l12)*(X(1,1)-X(1,3)-X(2,1)+X(2,3)))/(l13-(X(1,1)+X(3,3)-
2*X(1,3)))
d2313=((l13/l23)*(X(2,1)-X(2,3)-X(3,1)+X(3,3)))/(l13-(X(1,1)+X(3,3)-
2*X(1,3)))
f12=p12+d1213*p13
f23=p23+d2313*p13
fprintf('Power flow line 12 %g p.u.:\n',f12);
fprintf('Power flow line 23 %g p.u.:\n',f23);
disp ('.......................................................');
% Line outage of distribution factor outage of 2-3
disp ('For outage of line 2-3');
disp ('Line Outage distribution factor are:');
d1223=((l23/l12)*(X(1,2)-X(1,3)-X(2,2)+X(2,3)))/(l23-(X(2,2)+X(3,3)-
2*X(2,3)))
d1323=((l23/l13)*(X(1,2)-X(1,3)-X(3,2)+X(3,3)))/(l23-(X(2,2)+X(3,3)-
2*X(2,3)))
f12=p12+d1223*p23
f13=p13+d1323*p23
fprintf('Power flow line 12 %g p.u.:\n',f12);
fprintf('Power flow line 13 %g p.u.:\n',f13);
disp ('.......................................................');