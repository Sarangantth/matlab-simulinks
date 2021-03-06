%loop L & C of 1phase line: 1.1
%clc;
clear all;
D=input('enter the distance between conductors in m'); 
d=input('enter diameter in cm');
r=(d/2)*10^(-2);
r1=r*0.7788;
I=4*10^(-7)*log(D/r1); 
c=(pi*8.854*10^(-12))/(log(D/r));
disp('inducance(in h/m):'); 
disp(I); 
disp('capacitance(in f/m):'); 
disp(c);

%L & C of 3phase system: 1.2
%clc;
%clear all;
D=input('enter the distance between conductors in m'); 
d=input('enter diameter in cm');
r=(d/2)*10^(-2);
r1=r*0.7788;
I=2*10^(-7)*log(D/r1); 
c=(2*pi*8.854*10^(-12))/(log(D/r));
disp('inducance(in h/m):'); 
disp(I); 
disp('capacitance(in f/m):'); 
disp(c);

%L, C, X of 3phase 50Hz overload H.T line: 1.3
%clc;
r=input('enter the radius of the conductors : ');
Dab=input('Enter the spacing between the conductors A and B :'); 
Dbc=input('Enter the spacing between the conducors B and C '); 
Dca=input('Enter the spacing between the conducors C and A :');
GMRs=0.7788*r;
GMD=(Dab*Dbc*Dca)^(1/3);
disp('The inductance per phase of the three phase lines L in H/m'); 
L=2*10^(-7)*log(GMD/GMRs);
disp(L);
disp('The value of capacitance per phase of three phase lines C in F/m'); 
C=2*pi*8.854*10^(-12)/log(GMD/r);
disp(C);

%L & C per phase of 3phase T.L: 1.4
%clc;
disp("Calculation of inducance and capacitance of three phase unsymmetricuntransposed line");
Dab = input("Enter distance between conducors A and B : "); 
Dbc = input("Enter distance between conductors B and C : "); 
Dca = input("Enter distance between conductors C and A : "); 
R = input("Enter radius in cm : ");
r = R*(10^-2);
r1=r*exp(-1/4);
La = 2*10^(-7)*log((Dab*Dca)^(1/2)/r1)-(2*10^(-7)*(3)^(1/2)/2*log(Dca/Dab))*1i; 
Lb = 2*10^(-7)*log((Dbc*Dab)^(1/2)/r1)-(2*10^(-7)*(3)^(1/2)/2*log(Dab/Dbc))*1i; 
Lc = 2*10^(-7)*log((Dca*Dbc)^(1/2)/r1)-(2*10^(-7)*(3)^(1/2)/2*log(Dbc/Dca))*1i; 
Dm=(Dab*Dbc*Dca)^(1/3);
epsilon = 8.854 * 10^(-12);
Can=(2*pi*epsilon)/(log((Dca*Dab)/(r*Dm)) + (1/((3)^(1/2))*log(Dab/Dca))*1i); 
Cbn=(2*pi*epsilon)/(log((Dab*Dbc)/(r*Dm)) + (1/((3)^(1/2))*log(Dbc/Dab))*1i); 
Ccn = (2*pi*epsilon)/(log((Dca*Dbc)/(r*Dm)) + (1/((3)^(1/2))*log(Dca/Dbc))*1i); 
disp("Inductance of line A per phase in Him is : ");
disp(La);
disp("Inducance of line B per phase in Him is : "); 
disp(Lb);
disp("Inductance of line C per phase in H/m is : "); 
disp(Lc);
disp("Capacitance of Line A per phase in F/m is : "); 
disp(Can);
disp("Capacitance of Line B per phase in F/m is : "); 
disp(Cbn);
disp("capacitance of Line C per phase in F/m is : ");
disp(Ccn);

%L & C per phase of 3phase double circuit line: 1.5
%clc;
r=input('enter the radius of conductor in meters : ');
GMRsL=(0.7788*r);
GMRsc=(r);
D=input('enter the symmetrical spacing between the conductors placed in the vertices of hexagon in meters :');
GMD=(3)^(1/4)*D; 
GMRL=(2*D*GMRsL)^(1/2); 
GMRC=(2*D*GMRsc)^(1/2);
disp('the GMD value is : '); 
disp(GMD);
disp('the GMR for L estimation is : '); 
disp(GMRL); 
disp('the GMR for c estimation is '); 
disp(GMRC);
L=2*(10^(-7))*log(GMD/GMRL); 
disp('the value of inductance calculated in (H/m) is : '); 
disp(L);
epsilon=8.854*(10^(-12)); 
C=2*pi*epsilon/log(GMD/GMRC); 
disp('the value of capacitance calculated in (F/m) is : '); 
disp(C);

%L & C per phase of 3phase doule ckt line: 1.6
%clc;
r=input('enter the radius of conductor in meters : ');
GMRsI=(0.7788*r);
GMRsc=(r);
AA1=input('enter the distance AA1 in meters '); 
BB1=input('enter the distance BB1 in meters: '); 
CC1=input('enter the distance CC1 in meters: ');
GMRaI=(GMRsI*AA1)^(1/2); 
GMRbI=(GMRsI*BB1)^(1/2); 
GMRcI=(GMRsI*CC1)^(1/2);
GMRL=(GMRaI*GMRbI*GMRcI)^(1/3);
GMRac=(GMRsc*AA1)^(1/2); 
GMRbc=(GMRsc*BB1)^(1/2); 
GMRcc=(GMRsc*CC1)^(1/2);
GMRC=(GMRac*GMRbc*GMRcc)^(1/3); 
disp('the GMR for inductance calculation is ');
disp(GMRL);
disp('the GMR for capacitance calculation is '); 
disp(GMRC);
AB=input('enter the distance AB in meters '); 
AB1=input('enter the distance AB1 in meters ');
Dab=(AB*AB1)^(1/2);
BC=input('enter the distance BC in meters : '); 
BC1=input('enter the distance BC1 in meters ');
Dbc=(BC*BC1)^(1/2);
CA=input('enter the distance CA in meters '); 
CA1=input('enter the distance CA1 in meters ');
Dca=(CA*CA1)^(1/2);
GMD=(Dab*Dbc*Dca)^(1/3); 
disp('the GMD value is '); 
disp(GMD);
L=2*(10^(-7))*log(GMD/GMRL); 
disp('the value of inductance calculated in (Him) is : '); 
disp(L);
epsilon=8.854*(10^(-12)); 
C=2*pi*epsilon/log(GMD/GMRC); 
disp('the value of capacitance calculated in (F/m) is : '); 
disp(C);


%L & C per phase 3phase double ckt -transposed: 1.7
%clc;
r=input('enter the radius of conductor in meters : ');
GMRsI=(0.7788*r);
GMRsc=(r);
AA1=input('enter the distance AA1 in meters '); 
BB1=input('enter the distance BB1 in meters: '); 
CC1=input('enter the distance CC1 in meters: ');
GMRaI=(GMRsI*AA1)^(1/2); 
GMRbI=(GMRsI*BB1)^(1/2); 
GMRcI=(GMRsI*CC1)^(1/2);
GMRL=(GMRaI*GMRbI*GMRcI)^(1/3);
GMRac=(GMRsc*AA1)^(1/2); 
GMRbc=(GMRsc*BB1)^(1/2); 
GMRcc=(GMRsc*CC1)^(1/2);
GMRC=(GMRac*GMRbc*GMRcc)^(1/3); 
disp('the GMR for inductance calculation is '); 
disp(GMRL);
disp('the GMR for capacitance calculation is '); 
disp(GMRC);
AB=input('enter the distance AB in meters '); 
AB1=input('enter the distance AB1 in meters ');
%A1B=input('enter the distance AIB in meters ');
%A1B1=input('enter the distance A1B1 in meters : '); 
Dab=(AB*AB1)^(1/2);
BC=input('enter the distance BC in meters : '); 
BC1=input('enter the distance BC1 in meters ');
%B1C=input('enter the distance B1C in meters : ');
%B1C1=input('enter the distance B1C1 in meters : '); 
Dbc=(BC*BC1)^(1/2);
CA=input('enter the distance CA in meters '); 
CA1=input('enter the distance CA1 in meters ');
%C1A=input('enter the distance C1A1 in meters : ');
%C1A1=input('enter the distance C1A1 in meters : '); 
Dca=(CA*CA1)^(1/2);
GMD=(Dab*Dbc*Dca)^(1/3); disp('the GMD value is '); 
disp(GMD);
L=2*(10^(-7))*log(GMD/GMRL);
disp('the value of inductance calculated in (Him) is : '); 
disp(L);
epsilon=8.854*(10^(-12)); 
C=2*pi*epsilon/log(GMD/GMRC); 
disp('the value of capacitance calculated in (F/m) is : '); 
disp(C);


%3phase bundled conductor line: 1.8
%clc;
r=input('enter the radius of the sub conductors in meters : '); 
d=input('enter the bundle spacing distance : '); 
GMRL=(0.7788*r*d)^(1/2);
GMRC=(r*d)^(1/2);
AB=input('enter the distance between conductor A and B in meters :'); 
BC=input('enter the distance between conductor B and C in meters :'); 
CA=input('enter the distance between conductor C and A in meters :'); 
GMD=(AB*BC*CA)^(1/3);
L=2*(10^(-7))*log(GMD/GMRL); 
C=2*pi*(8.854*10^(-12))/log(GMD/GMRC);
disp('the value of inductance L ='); 
disp(L); 
disp('the value of capacitance c ='); 
disp(C);


