clc;
Pm=input('Generator output power in p.u. Pm : '); 
E=input('Generator e.m.f. in p.u. E = ');
V=input('Infinite bus-bar voltage in p.u. V = '); 
X1=input('Reactance before Fault in p.u. Xl = '); 
X2=input('Reactance during Fault in p.u. X2 = ');
X3=input('Reactance after Fault in p.u. X3 = ');
Pe1max=E*V/X1;
Pe2max=E*V/X2;
Pe3max=E*V/X3;
delta = 0:.01 :pi;
Pe1=Pe1max*sin(delta); 
Pe2=Pe2max*sin(delta); 
Pe3=Pe3max*sin(delta); 
d0=asin(Pm/Pe1max);
dmax=pi-asin(Pm/Pe3max); 
cosdc=(Pm*(dmax-d0)+Pe3max*cos(dmax)-Pe2max*cos(d0))/(Pe3max-Pe2max);
dc=acos(cosdc);
d0=d0*180/pi; 
dmax=dmax*180/pi;
dc=dc*180/pi;
H=input('To find to enter Inertia Constant H, (or 0 to skip) H =');
if H~=0
    d0r=d0*pi/180;
    dcr=dc*pi/180; 
    tc=sqrt(2*H*(dcr-d0r)/(pi*60*Pm)); 
else 
end
fprintf('\nInitial power angle = %4.3f\n',d0);
fprintf('\nMaximum angle swing = %4.3f \n',dmax); 
fprintf('Critical clearing angle = %4.3f \n\n',dc);
if  X2==inf&&H~=O
    fprintf('Critical clearing time = %4.3f sec. \n\n', tc)
else 
end
Pmx=[0 pi-d0]*180/pi; 
Pmy=[Pm Pm];
x0=[d0 d0]*180/pi;
y0=[0 Pm];
xc=[dc dc]*180/pi;  
yc=[0 Pe3max*sin(dc)]; 
xm=[dmax dmax]*180/pi;  
ym=[0 Pe3max*sin(dmax)];
x=(d0:.1 :dc);
y=Pe2max*sin(x*pi/180);
yl=Pe2max*sin(d0*pi/180);
y2=Pe2max*sin(dc*pi/180);  
x=[d0 x dc];
y=[Pm y Pm];
xx=dc:.1:dmax;
h=Pe3max*sin(xx*pi/180); 
xx=[dc xx dmax];
hh=[Pm h Pm];
delta=delta*180/pi; 
h=figure; 
figure(h); 
fill(x,y,'m') 
hold; 
fill(xx,hh,'c')
plot(delta, Pe1 ,'-', delta, Pe2, 'r-', delta, Pe3, 'g-', Pmx, Pmy, 'b-', x0, y0, xc, yc, xm, ym), grid 
title('Application of equal area criterion to a critically cleared system')
xlabel('Power angle, degree'), 
ylabel('Power, per unit') 
text(5,1.07*Pm, 'Pm')
text(50,1.05*Pe1max,['Critical clearing angle = ',num2str(dc)]) 
axis([0 180 0 1.1*Pe1max]) 
hold off;
