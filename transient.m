clc;
Pm = input('Generator output power in p.u. Pm =');
E = input('Generator e.m.f. in p.u. E ='); 
V = input('Infinite bus-bar voltage in p.u. V = '); 
X1 = input('Reactance before Fault in p.u. Xl = ');
X2 = input('Reactance during Fault in p.u. X2 = ');
X3 = input('Reactance after Fault in p.u. X3 =  ');
D = input('Enter the Damping ratio = '); 
f0 = input('Enter the frequency of the system =');
H = input('Enter the value of inertia constant ='); 
Pmax=E*V/X1;
d0=asin(Pm/Pmax); 
Ps=Pmax*cos(d0);
wn=sqrt(pi*60/H*Ps); 
wd=wn*sqrt(1-z^2);
fd=wd/(2*pi);
tau=l/(z*wn);
th=acos(z);
Dd0=10*pi/180;
t=0:.01:3;
Dd=Dd0/sqrt(1-z^2)*exp(-z*wn*t)*sin(wd*t+th);
d=(d0+Dd)*180/pi;
Dw=-wn*Dd0/sqrt(1-z^2)*exp(-z*wn*t)*sin(wd*t);
f=f0+Dw/(2*pi);
figure(l), subplot(2, 1 , 1), plot(t, d), grid;
xlabel('t, sec'), ylabel('Delta, degree'); 
subplot(2,1 ,2), plot(t, f), grid;
xlabel('t, sec'), ylabel('f, Hz');
