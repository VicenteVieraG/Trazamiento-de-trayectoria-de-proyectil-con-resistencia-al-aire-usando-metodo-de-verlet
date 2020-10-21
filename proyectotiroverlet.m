clear all
clc
%-------------------parametros iniciales-----------------
ts=.1;
g = 9.81;
y0=0;
x0=0;
t=0:.1:8.4;
vi= 50;
ang=60;
angr=deg2rad(ang);
vix=vi*cos(angr);
viy=vi*sin(angr);
densidadDelAire=1.2;
coeficienteDeArrastre=0.011;
%densidad de la piedra
prock=100;
masa=1;
volumen=masa/prock;
radio=(3*volumen/(4*pi))^(1/3);
area=pi*radio^2;
b=0.5*densidadDelAire*coeficienteDeArrastre*area;

%---------------operaciones para determinar valores de x-------------------

%s prima de x en al primera posicion
spta=-abs(vix)/vix*b/masa*vix^2;
%posicion xn-1
xa=x0-vix*ts-(spta*ts^2);

%calculamos y añadimos los valores de x al arreglo de valores en x
x=zeros(1,90);
x(1)=xa;
x(2)=x0;
for i=3:90
    x(i)=(2.*x(i-1)-x(i-2))-(((x(i-1)-x(i-2))./ts).^2)*(b/masa).*ts^2;
    x1(i,1) = x(i);
end

%---------------operaciones para determinar valores de y-------------------

sptay =  g.* abs(viy)/viy .* b/masa .* viy.^2;
ya = y0 - viy .* ts - sptay .* ts.^2;

%calculamos y añadimos los valores de y
y=zeros(1,90);
y(1)=ya;
y(2)=y0;
for i=3:90
    y(i)=(2.*y(i-1)-y(i-2))-(((y(i-1)-y(i-2))/ts)^2).*(angr/masa).*ts^2-g.*ts.^2;
    y1(i,1) = y(i);
end


% figure('Name','Volcán')
% ciclocos = -pi:pi/100:pi;
% volcan= 2.*cos(ciclocos);
% plot(ciclocos,volcan)

%xna=x0-ts


