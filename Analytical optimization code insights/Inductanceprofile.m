Ps=input('enter the number of stator poles: ');
Pr=input('enter the number of rotor poles: ');
fprintf('The motor is %d /%d configuration\n',Ps,Pr);
E=360/((Ps/2)*Pr);
fprintf('The stroke angle is %0.1d \n',E);
fprintf('There are %d phases in the motor and their inductance profiles are displaced by %d degrees apart\n',Ps/2, E);
Bs=input('enter the stator pole arc angle in degrees:');
Br=input('Enter the rotor pole arc angle in degrees:');
Lu=0.5;
La=3;
Flp=abs(Ps-Pr);%angle for which the inductance is a flat top i.e at aligned position
Flc=((Ps/2)*E)-2*Bs-Flp;%angle for which the inductance is a valley i.e at unaligned position
ang=[-Flc/2 Flc/2 (Flc/2)+Bs (Flc/2)+Bs+Flp (Flc/2)+2*Bs+Flp ((Ps/2)*E)];
LA=[Lu Lu La La Lu Lu];
angle=0:0.5:((Ps/2)*E);
phaind=interp1(ang,LA,angle);
plot(angle,phaind,'r');
grid on;
hold on;
ang=E+ang;
LA=[Lu Lu La La Lu Lu];
angle=0:0.5:((Ps/2)*E);
phbind=interp1(ang,LA,angle);
plot(angle,phbind,'b');
grid on;
hold on;
