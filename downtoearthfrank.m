function downtoearth
clear;clc;
load topo;
cla reset;
close all;
format long;
%--------------------------------------------------------------------------------
au=149597871;
%the revolution radius of the solar system
%the revolution radius of the moon is 30 times magnified

r(1)=0.3871;
r(2)=0.7233;
r(3)=1;
r(4)=1.5237;
r(5)=5.2026;
r(6)=9.5549;
r(7)=19.2184;
r(8)=30.1104;
r(9)=384399*30/au;%half length of the long-axis a
%ecliptic obliquity
theda(1)=7.005;
theda(2)=3.395;
theda(3)=0;
theda(4)=1.850;
theda(5)=1.303;
theda(6)=2.489;
theda(7)=0.773;
theda(8)=1.770;
theda(9)=5.145;
%the tilt angle of the rotation axis 
angle(1)=0;
angle(2)=177.4;
angle(3)=23.44;
angle(4)=25.09;
angle(5)=3.08;
angle(6)=26.7;
angle(7)=97.9;
angle(8)=27.8;
angle(9)=1.5424;

for i=1:9
   theda(i)=theda(i)*pi/180 ;
end
%the cycle of the revolution of planets
T(1)=87.97;
T(2)=225;
T(3)=365.24;
T(4)=687;
T(5)=11.86*365.24;
T(6)=29.46*365.24;
T(7)=84.01*365.24;
T(8)=164.82*365.24;
T(9)=27.321582;
%the cycle of the rotation of planets 
S(1)=59;
S(2)=243;
S(3)=1436/1440;
S(4)=1477/1440;
S(5)=590/1440;
S(6)=639/1440;
S(7)=(17*60+14)/1440;
S(8)=(16*60+6)/1440;
S(9)=27.321582;
%the radius of the planets
%the planets are 1000 times magnified; the sun is 30 times magnified
s(1)=2440000/au;
s(2)=6052000/au;
s(3)=6378000/au;
s(4)=3397000/au;
s(5)=71492000/au;
s(6)=60268000/au;
s(7)=25559000/au;
s(8)=24764000/au;
ssun=6960000/au*3;
s(9)=1737100/au;
%the eccentricity of the moon
Moone=0.0549;
Moonc=r(9)*Moone;
Moona=r(9);
Moonb=(Moona^2-Moonc^2)^0.5;

%the largest hight on the z-axis caused by the tilt angle
for i=1:9
h(i)=r(i)*sin(theda(i));
end

%-------------------------------------------------------------------------------------------------------
x={};
y={};
z={};
[a b c] = sphere(36);
for i=1:9
x{i}=a.*s(i);
y{i}=b.*s(i);
z{i}=c.*s(i);
end


myaxes=axes('xlim',[-35 35],'ylim',[-35 35],'zlim',[-35 35],'box','off');%set the limits of the axis
%earth
Earth= surface(x{3},y{3},z{3},'FaceColor','texturemap','CData',topo,'EdgeColor','none');


view(3);%set the view angle
grid off;

hold on;
axis off

colordef none


%mercury
Mercurytopo=imread('Mercury.jpg');
Mercury=surface(x{1},y{1},z{1},'FaceColor','texturemap','CData',Mercurytopo,'EdgeColor','none');
%venus
Venustopo=imread('Venus.jpg');
Venus=surface(x{2},y{2},z{2},'FaceColor','texturemap','CData',Venustopo,'EdgeColor','none');
%mars
Marstopo=imread('Mars.jpg');
Mars=surface(x{4},y{4},z{4},'FaceColor','texturemap','CData',Marstopo,'EdgeColor','none');
%jupiter
Jupitertopo=imread('Jupiter.jpg');
Jupiter=surface(x{5},y{5},z{5},'FaceColor','texturemap','CData',Jupitertopo,'EdgeColor','none');
%saturn
Saturntopo=imread('Saturn.jpg');
Saturn(1)=surface(x{6},y{6},z{6},'FaceColor','texturemap','CData',Saturntopo,'EdgeColor','none');
m=2.*s(6)*a;
n=2.*s(6)*b;
o=0.05.*s(6)*c;

mm=2.3.*s(6)*a;
nn=2.3.*s(6)*b;
oo=0.02.*s(6)*c;


Saturn(2)=surf(m,n,o,'FaceColor',[0,0,0]/255,'facealpha',0.98,'EdgeColor','none','FaceLighting','phong');
Saturn(3)=surface(mm,nn,oo,'FaceColor','texturemap','CData',Saturntopo,'EdgeColor','none');
%uranus
Uranustopo=imread('Uranus.jpg');
Uranus=surface(x{7},y{7},z{7},'FaceColor','texturemap','CData',Uranustopo,'EdgeColor','none');
%neptune
Neptunetopo=imread('Neptune.jpg');
Neptune=surface(x{8},y{8},z{8},'FaceColor','texturemap','CData',Neptunetopo,'EdgeColor','none');

%moon
Moontopo=imread('moon.jpg');
Moon=surface(x{9},y{9},z{9},'FaceColor','texturemap','CData',Moontopo,'EdgeColor','none');
%sun
[xsun,ysun,zsun]=sphere(36);
xsun=ssun*xsun;
ysun=ssun*ysun;
zsun=ssun*zsun;
Sun=surface(xsun,ysun,zsun,'FaceColor','texturemap','CData',imread('sun.jpg'),'EdgeColor','none');

%integrate the earth as an object
Earthobject=hgtransform('parent',myaxes);
set(Earth,'parent',Earthobject)
drawnow
%integrate the mercury as an object
Mercuryobject=hgtransform('parent',myaxes);
set(Mercury,'parent',Mercuryobject)
drawnow
%integrate the venus as an object
Venusobject=hgtransform('parent',myaxes);
set(Venus,'parent',Venusobject)
drawnow
%integrate the mars as an object
Marsobject=hgtransform('parent',myaxes);
set(Mars,'parent',Marsobject)
drawnow
%integrate the jupiter as an object
Jupiterobject=hgtransform('parent',myaxes);
set(Jupiter,'parent',Jupiterobject)
drawnow
%integrate the saturn as an object
Saturnobject=hgtransform('parent',myaxes);
set(Saturn,'parent',Saturnobject)
drawnow
%integrate the uranus as an object
Uranusobject=hgtransform('parent',myaxes);
set(Uranus,'parent',Uranusobject)
drawnow
%integrate the neptune as an object
Neptuneobject=hgtransform('parent',myaxes);
set(Neptune,'parent',Neptuneobject)
drawnow
%integrate the moon as an object
Moonobject=hgtransform('parent',myaxes);
set(Moon,'parent',Moonobject)
drawnow

%integrate the sun as an object
Sunobject=hgtransform('parent',myaxes);
set(Sun,'parent',Sunobject)
drawnow
%---------------------------------------------------------------------------------------

    

%make the plnets rotate and revolve(t should be the same to avoid the error)
%a frame of the picture equals half a day for the earth
%the smaller the value d is, the more data it has
d=0.1;
%loop of the moon
loop=30;
%loop/d is better smaller than 5000 for regular laptop!!

%earth
t=0:pi/T(3)*d:loop*2*pi*T(1)/T(3);
x3direction=[r(3)*cos(theda(3))*cos(t)];
y3direction=[r(3)*cos(theda(3))*sin(t)];
z3direction=h(3)*cos(t);
%mercury
t1=0:pi/T(1)*d:loop*2*pi;
x1direction=[r(1)*cos(theda(1))*cos(t1)];
y1direction=[r(1)*cos(theda(1))*sin(t1)];
z1direction=h(1)*cos(t1);
%venus
t2=0:pi/T(2)*d:loop*2*pi*T(1)/T(2);
x2direction=[r(2)*cos(theda(2))*cos(t2)];
y2direction=[r(2)*cos(theda(2))*sin(t2)];
z2direction=h(2)*cos(t2);
%earth(first)
t3=t;
%mars
t4=0:pi/T(4)*d:loop*2*pi*T(1)/T(4);
x4direction=[r(4)*cos(theda(4))*cos(t4)];
y4direction=[r(4)*cos(theda(4))*sin(t4)];
z4direction=h(4)*cos(t4);
%jupiter
t5=0:pi/T(5)*d:loop*2*pi*T(1)/T(5);
x5direction=[r(5)*cos(theda(5))*cos(t5)];
y5direction=[r(5)*cos(theda(5))*sin(t5)];
z5direction=h(5)*cos(t5);
%saturn
t6=0:pi/T(6)*d:loop*2*pi*T(1)/T(6);
x6direction=[r(6)*cos(theda(6))*cos(t6)];
y6direction=[r(6)*cos(theda(6))*sin(t6)];
z6direction=h(6)*cos(t6);
%uranus
t7=0:pi/T(7)*d:loop*2*pi*T(1)/T(7);
x7direction=[r(7)*cos(theda(7))*cos(t7)];
y7direction=[r(7)*cos(theda(7))*sin(t7)];
z7direction=h(7)*cos(t7);
%neptune
t8=0:pi/T(8)*d:loop*2*pi*T(1)/T(8);
x8direction=[r(8)*cos(theda(8))*cos(t8)];
y8direction=[r(8)*cos(theda(8))*sin(t8)];
z8direction=h(8)*cos(t8);
%moon
t9=0:pi/T(9)*d:loop*2*pi*T(1)/T(9);
x9direction=[Moona*cos(theda(9))*cos(t9)]+x3direction;
y9direction=[Moonb*cos(theda(9))*sin(t9)]+y3direction;
z9direction=h(9)*cos(t9)+z3direction;





for i=1:length(x3direction)
    
   
    translation1=makehgtform('translate',[x1direction(i) y1direction(i) z1direction(i)]);%水星公轉之位子
    zrotation1=makehgtform('zrotate',t(i)*T(3)*S(3)/S(1));
    
    translation2=makehgtform('translate',[x2direction(i) y2direction(i) z2direction(i)]);%金星公轉之位子
    zrotation2=makehgtform('zrotate',t(i)*T(3)*S(3)/S(2));
    yrotation2=makehgtform('yrotate',angle(2)*pi/180);
    
    translation3=makehgtform('translate',[x3direction(i) y3direction(i) z3direction(i)]);%地球公轉之位子
    zrotation3=makehgtform('zrotate',t(i)*T(3));
    yrotation3=makehgtform('yrotate',angle(3)*pi/180);
    
    translation4=makehgtform('translate',[x4direction(i) y4direction(i) z4direction(i)]);%火星公轉之位子
    zrotation4=makehgtform('zrotate',t(i)*T(3)*S(3)/S(4));
    yrotation4=makehgtform('yrotate',angle(4)*pi/180);
    
    translation5=makehgtform('translate',[x5direction(i) y5direction(i) z5direction(i)]);%木星公轉之位子
    zrotation5=makehgtform('zrotate',t(i)*T(3)*S(3)/S(5));
    yrotation5=makehgtform('yrotate',angle(5)*pi/180);
    
    translation6=makehgtform('translate',[x6direction(i) y6direction(i) z6direction(i)]);%土星公轉之位子
    zrotation6=makehgtform('zrotate',t(i)*T(3)*S(3)/S(6));
    yrotation6=makehgtform('yrotate',angle(6)*pi/180);
    
    translation7=makehgtform('translate',[x7direction(i) y7direction(i) z7direction(i)]);%天王星公轉之位子
    zrotation7=makehgtform('zrotate',t(i)*T(3)*S(3)/S(7));
    yrotation7=makehgtform('yrotate',angle(7)*pi/180);
    
    
    translation8=makehgtform('translate',[x8direction(i) y8direction(i) z8direction(i)]);%海王星公轉之位子
    zrotation8=makehgtform('zrotate',t(i)*T(3)*S(3)/S(8));
    yrotation8=makehgtform('yrotate',angle(8)*pi/180);
    
    
    translation9=makehgtform('translate',[x9direction(i) y9direction(i) z9direction(i)]);%月球公轉之位子
    zrotation9=makehgtform('zrotate',t(i)*T(3)*S(3)/S(9));
    yrotation9=makehgtform('yrotate',angle(9)*pi/180);
    
    
     set(Mercuryobject,'matrix',translation1*zrotation1);
     set(Venusobject,'matrix',translation2*yrotation2*zrotation2);
     set(Earthobject,'matrix',translation3*yrotation3*zrotation3);
     set(Marsobject,'matrix',translation4*yrotation4*zrotation4);
     set(Jupiterobject,'matrix',translation5*yrotation5*zrotation5);
     set(Saturnobject,'matrix',translation6*yrotation6*zrotation6);
     set(Uranusobject,'matrix',translation7*yrotation7*zrotation7);
     set(Neptuneobject,'matrix',translation8*yrotation8*zrotation8);
     set(Moonobject,'matrix',translation9*yrotation9*zrotation9);
     
    pause(0.01)
   
end   
for i=1:2500
    %annihlation of the solar system
scaling=makehgtform('scale',1+0.1*i);
set(Sunobject,'matrix',scaling);
pause(0.01)
end
end









