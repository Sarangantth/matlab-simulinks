clc; 
clear all;
L=input('enter the number of lines:'); 
N=0;
for p=1:L
    C=menu('specify the case number', 'connect a new bus to reference bus','connect an old bus to new bus', 'connect an old bus to reference bus', 'connect two old buses');


switch C 
    case{1}
        m=input('enter new bus number:'); 
        N=max(N,m);
        Zi=input('enter impedance of the line:'); 
        Zbus(m,:)=0;
        Zbus(:,m)=0; 
        Zbus(m,m)=Zi;
        disp(Zbus);

    case{2}
        m=input('enter new bus number'); 
        N=max(N,m);
        n=input('enter existing bus number:'); 
        Zi=input('enter impedance of the line:'); 
        Zbus(m,:)=Zbus(n,:);
        Zbus(:,m)=Zbus(:,n); 
        Zbus(m,m)=Zi+Zbus(n,n);
        disp(Zbus);

    case{3}
        m=L+1;
        n=input('enter existing bus number:'); 
        Zi=input('enter impedance of the line:'); 
        Zbus(m,:)=Zbus(n,:);
        Zbus(:,m)=Zbus(:,n);
        Zbus(m,m)=Zi+Zbus(n,n); 
        Zbusnew=zeros(N,N);

    for x=1:N 
        for y=1:N
            Zbusnew(x,y)=Zbus(x,y)-Zbus(x,m)*Zbus(m,y)/Zbus(m,m);
        end 
    end

    Zbus=Zbusnew


    case{4}
        m=L+1;
        n=input('enter first existing new number:'); 
        o=input('enter second existing bus number;'); 
        Zi=input('enterimpedance of the line:'); 
        Zbus(m,:)=Zbus(n,:)-Zbus(o,:);
        Zbus(:,m)=Zbus(:,n)-Zbus(:,o);
        Zbus(m,m)=Zi+Zbus(n,n)+Zbus(o,o)-2*Zbus(n,o); 
        Zbusnew=zeros(N,N);



    for x=1:N 
        for y=1:N
            Zbusnew(x,y)=Zbus (x,y)-Zbus(x,m)*Zbus(m,y)/Zbus(m,m); 
        end
    end 
    Zbus=Zbusnew
 

end 
end
disp(Zbus);