C1=110;                          %Input voltage
L=50E-3;                         %Inductance value
w=2*pi*60;                       %Angular frequency
R=1;       
alpha=atan((w*L)/R);             %Phase shift for resulting signal
A1=(C1)*(1/sqrt((R)^2+(w*L)^2)); 
A2=C1*(w*L)/(R^2+(w*L)^2);
A3=(C1*w)*(1/sqrt((R/L)^2+w^2));
A4=(R/L)*(w*C1/((R/L)^2+w^2));

cont=0;
ciclos=12;
for wt=0:0.2:(2*pi)*ciclos;
    cont=cont+1;
    T(cont)=wt/(w);
    x(cont)=wt;
    y1(cont)=A1*sin(x(cont)-alpha);
    y2(cont)=A2*exp((-R/L)*T(cont));
    I(cont)=y1(cont)+y2(cont);
    y4(cont)=A4*exp((-R/L)*T(cont));
    y5(cont)=A3*cos(x(cont)-alpha)-y4(cont);
    V(cont)=C1*sin(x(cont));
end

plot(T,y2,T,I);
