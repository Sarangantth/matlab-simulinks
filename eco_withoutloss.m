clc;
clear all;
n=input('Enter no of generating stations: ');
Pd=input('Enter load demand: ');
for i=1:n
    a(i)=input('enter coefficient of pi^2: ');
    b(i)=input('enter coefficient of pi: ');
    c(i)=input('enter constant: ');
    Pmin(i)=input('Enter min power gen: ');
    Pmax(i)=input('Enter max power gen: ');
end
Nr=0;
Dr=0;
for i=1:n
    Nr=Nr+(b(i)/(2*a(i)));
    Dr=Dr+(1/(2*a(i)));
end
lambda=(Pd+Nr)/Dr;
for i=1:n
    Pg(i)=(lambda-b(i))/(2*a(i));
end
Pg
for i=1:n
    if(Pg(i)>Pmax(i))
        Pg(i)=Pmax(i);
        Nrnew=0;
        Drnew=0;
        for j=1:n
            if(j~=i)
                Nrnew=Nrnew+(b(j)/(2*a(j)));
                Drnew=Drnew+(1/(2*a(j)));
            end
        end
        lambdanew=(Pd-Pg(i)+Nrnew)/Drnew;
        for k=1:n
            if(k~=i)
                Pg(k)=(lambdanew-b(k))/(2*a(k));
            end
        end
    end
end
Pg
