clc; 
clear all;

v=1;%Prefault voltage 
sysv=20;%system base voltage 
bmva=100;%system base mva 
z1=input('enter z1');
z2=z1 ;
z0=input('enter z0'); 
zf=input('Enter the value of zf'); 
for i=1:4
    A=menu('Enter the type of fault','1.LLL fault','2.LG fault' ,'3.LL fault','4.LLG fault'); 
    ib=bmva/ (1.732*sysv) ;
    a=-0.5+.866j; 
    if(A==1)
        disp('three phase fault' );
        fprintf('\n%s \n',repmat('-',1,25')); 
        ifpu=v/(z1+zf);
        ifa1=ifpu*ib ; 
    end
    if(A==2)
        disp('Single line to ground fault'); 
        fprintf('\n%s \n',repmat('-',1,25')) 
        ia1=v/(z0+z1+z2+3*zf); 
        ifpu=3*ia1;
        ifa1=ifpu*ib ; 
    end
    if(A==3)
        disp('double line fault') ; 
        fprintf('\n%s \n',repmat('-',1,25')) 
        ia1=v/(z1+z2+zf);
        ia2=-(1.732*ia1);
        ifa1=abs(ia2)*ib; 
    end
    if(A==4)
        disp('double line to ground fault'); 
        fprintf('\n%s \n',repmat('-',1,25')); 
        z=(z2*(z0+(3*zf)))/(zO+z2+3*zf); 
        ia1=v/(z1+z);
        ia2=(-v/z2)+((ia1*z1)/z2); 
        ia0=-(ia1+ia2);
        ib1=iaO+(a*a*ia1)+(a*ia2); 
        ic1=iaO+(a*ia1)+(a*a*ia2); 
        ifapu1=(ib1+ic1); 
        ifa1=ifapu1*ib;
    end 
    ifa1=abs(ifa1);
    fmva=1.732 *sysv*abs(ifa1 ); 
    fprintf('fault current %g KA \n',ifa1); 
    fprintf('fault MVA %g MVA \n',fmva); 
    fprintf('\n%s \n',repmat('=' ,1,75')) 
    i=i+1;
end
