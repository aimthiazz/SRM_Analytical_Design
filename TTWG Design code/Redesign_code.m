%%Design of Outer rotor Switched reluctance motor 
display('choose the configuration of SRM');
Ps=input('enter the number of stator poles:'); 
Pr=input('enter the number of rotor poles:');
Tr=input('enter the required continous torque rating of the SRM motor:');
Do=input('enter the overall outer diameter in mm:');
D=input('Enter the bore diameter including airgap in mm:');
Lstk=input('Enter the stack length of the motor in mm:');
Lg=input('enter the airgap length in mm:');
display('Diameter of the shaft is assumed to be 30mm as per IEC71 standard')
Bsp=input('Enter the maximum flux density in tesla at the  stator pole (knee point of the material):');
Bs=input('enter the stator pole arc in deg:');
Br=input('enter the rotor pole arc in deg:');
I=input('enter the rated current:');
S=input('enter the speed in rpm:');
w=2*pi*S/60;%conversion from rpm to rad
E=360/((Ps/2)*Pr);%stroke angle calculation
Er=E*pi/180;
Bs=Bs*pi/180;
Br=Br*pi/180;
Do=Do/1000;
D=D/1000;
Lstk=Lstk/1000;
Lg=Lg/1000;
Dsh=30/1000;
uo=4*pi*10^-7;
%%Material selection for Stampings
display('choose the stamping material');
display('1. M-19');
display('2. M-43');
display('3. M-45');
mat=input('enter the choice of material:');
switch mat
    case 1
        B=[0	0.7526	0.7716	0.7907	0.8098	0.8289	0.8479	0.867	0.8861	0.9052	0.9242	0.9433	0.9624	0.9815	1.001	1.02	1.039	1.058	1.077	1.096	1.115	1.134	1.153	1.172	1.191	1.21	1.229	1.249	1.268	1.287	1.306	1.325	1.344	1.363	1.382	1.401	1.42	1.439	1.458	1.477	1.496	1.515	1.534	1.553	1.572	1.59	1.609	1.628	1.647	1.665	1.684	1.703	1.722	1.74	1.759	1.778	1.796	1.815	1.834	1.852	1.871	1.89	1.908	1.926	1.944	1.961	1.979	1.996	2.012	2.027	2.041	2.056	2.069];
        H=[0	72.33592164	74.39697815	76.57740087	78.85331655	81.16902098	83.55634512	86.10282421	88.72888077	91.51409228	94.5380362	97.64155759	100.9042339	104.1669103	107.5887415	111.2493052	115.3077563	119.8436721	124.6978979	129.950011	135.679589	141.9662092	149.1281817	157.4838162	166.8739578	177.1394517	188.5190301	201.8084678	217.4056523	234.5148086	254.5683315	281.6246718	314.0922802	347.9922831	392.4760897	446.190883	520.1979315	615.8500523	746.595838	881.7183847	1054.401498	1241.408556	1480.936745	1748.31705	2064.239612	2427.908657	2814.655169	3263.472108	3791.070744	4399.042627	5024.521553	5692.17654	6386.092092	7136.507648	7957.747155	8825.141594	9803.944494	10894.15585	12032.1137	13241.69127	14650.21251	16233.8042	18024.29731	20172.88904	22536.33994	25210.14299	28440.98833	31974.22807	36279.36928	41595.14438	47404.2998	53762.53978	61266.69534];
    case 2
        B=[0	0.8153	0.8557	0.8962	0.9367	0.9771	1.018	1.058	1.099	1.139	1.179	1.22	1.26	1.301	1.341	1.382	1.422	1.463	1.503	1.544	1.584	1.625	1.665	1.706	1.746	1.786	1.827	1.867	1.907	1.947	1.987	2.026	2.064	2.1	2.134	2.164];
        H=[0	42.49436981	45.60584894	48.70141259	51.22401843	53.6829623	56.68303298	60.5504981	65.72303375	72.36775262	80.13451385	89.12676813	101.3816987	119.6049397	145.6267729	183.3464944	246.6901618	363.50989	569.7746963	905.5916262	1419.662092	2178.035396	3249.148163	4657.66941	6362.21885	8284.014788	10400.77553	12851.76165	15979.15629	20340.00173	26642.53747	35690.49599	48168.24353	64513.45618	84590.85225	107509.1641];
    case 3
        B=[0	0.6976	0.7359	0.7742	0.8125	0.8507	0.889	0.9273	0.9656	1.004	1.042	1.08	1.119	1.157	1.195	1.234	1.272	1.31	1.348	1.387	1.425	1.463	1.501	1.54	1.578	1.616	1.655	1.693	1.731	1.769	1.808	1.846	1.884	1.922	1.96	1.998	2.035	2.072];
        H=[0	80.93028856	86.4211341	90.87747251	95.73169827	99.63099438	103.2915581	109.3394459	116.2626859	122.8676161	130.8253632	140.9317021	152.390858	164.5662112	178.8105786	197.4317069	220.8274835	246.9288942	277.4070658	323.7211542	401.1500341	516.6965227	672.8275219	892.8592307	1240.612781	1806.408604	2657.091775	3804.598915	5210.732837	6819.789311	8602.324674	10599.71921	12899.50814	15716.55063	19305.4946	24024.43866	30263.31243	38420.00326];
    otherwise
        display('Enter a valid choice number:');
end
        
%%calculation of Design parameters
%Asp is the area of the stator pole
Asp=((D/2)-Lg)*Bs*Lstk;
display('Asp=');
display(Asp);
%phis is the stator pole flux
phis=Bsp*Asp;
%phisy is the stator yoke flux
phisy=phis/2;
%Asy is the area of the stator yoke
Asy=Asp;
%Bsy is the thickness of the stator yoke
Bsy=Asy/Lstk;
%Hs is the height of the stator pole
Hs=((D-Dsh)/2)-Lg-Bsy;
%Arp is the area of the rotor pole
Arp=((D/2))*Br*Lstk;
%Brp is the rotor pole flux density
Brp=Bsp*Asp/Arp;
%Ary is the area of rotor yoke
Ary=Asp/1.6;
%Bry is the thickness of the rotor yoke
Bry=Ary/Lstk;

%Ary=Arp/2;
%Bry=Ary/Lstk;
%Hr is the rotor pole height
Hr=((Do-D)/2)-Bry;
%Ag is the airgap area
Ag=((D-Lg)/2)*((Bs+Br)/2)*Lstk;
%Bg is the airgap flux density
Bg=Bsp*Asp/Ag;
%Hg is the airgap field intensity
Hg=Bg/uo;
%Bys is the stator yoke flux density
Bys=phisy/Asy;
%Byr is the rotor yoke flux density
Byr=phisy/Ary;
 
%Ampere-turns calculation from BH data
Hsp=interp1(B,H,Bsp,'spline');
Hrp=interp1(B,H,Brp,'spline');
Hry=interp1(B,H,Byr,'spline');
Hsy=interp1(B,H,Bys,'spline');

%Length of the flux paths
Lsp=Hs+Bsy/2;
Lrp=Hr+Bry/2;
Lsy=(pi/2)*(Dsh+Bsy);
Lry=(pi/2)*(Do+Bry);


%%MMF calculation 
%MMF=Tph*I
MMF=2*(Hsp*Lsp+Hrp*Lrp+Hg*Lg)+0.5*(Hsy*Lsy+Hry*Lry);
Tph=MMF/I;
Tph=round(Tph);

%%Voltage source requirement 
Lambda=Tph*phis;
Vdc=(Lambda/Er)*w;

%%winding slot design 
J=input('Enter the current density required in A/mm^2 usual values (6 or 7):');
Ac=I/(2*J);%Ac is the area of cross-section
dw=sqrt(4*Ac/pi)+0.1;%dw is the diameter of the winding and 0.1mm is for insulation thickness
%the winding pattern area will look like right-angled triangle
%The height of the triangle is computed from approximation
display('The cross-section of winding required is:');
display(Ac);
display('The diameter of the winding will be:');
display(dw);
hwind=((((D/2)-Lg)*(2*pi/Ps)-((D/2)-Lg)*Bs)*0.9)/2;
hwt=hwind-2*10^-3;%winding clearance of 2mm each;height of the winding
hwb=Hs-6*10^-3;%base height of the winding 4mm is the clearance
tot_windarea=0.5*hwb*hwt;%Total winding area 
act_windarea=(Tph/2)*Ac*10^-6;%actual winding area
ff=act_windarea/tot_windarea;
if ff<=0.25
    display('The winding shall be accomodated within the space');
else
    pause;
end

%%Copper loss calculation
%lm is the mean length of the winding
lm=2*Lstk+4*hwt+2*D*sin(Bs/2);
%r is the resitance per phase
r=0.0177*lm*Tph/Ac;
%Pcu is the copper loss
Pcu=I*I*r;
display('The total copper loss in watts will be');
display(Pcu);

%calculation of Inductance in various paths
%%Aligned inductance
%%There are two paths one is main path through which we arrived at the
%%parameters and Leakage flux path
%Aligned inductance main path La1
La1=Tph*phis/I;
%Aligned inductance leakage path
del=100;
    Ag7=(3*Hs/4)*Lstk;
    Asp7=(3*Hs/4)*Lstk;
    Asy7=Bsy*Lstk;
    
    Lg7=(pi/4)*(3*Hs/4);
    Lsp7=3*Hs/4+Bsy/2;
    Lsy7=3*Hs/4;
    
while (abs(del)>20)
    phis7=Bsp*Asp;
    
    Rg7=Lg7/(uo*Ag7);
    Pg7=1/Rg7;
    
    Bsp7=phis7/Asp7;
    Bsy7=phis7/Asy7;
    
    Hsp7=interp1(B,H,Bsp7,'spline');
    Hsy7=interp1(B,H,Bsy7,'spline');
    
    MMF7=(1/2)*Tph*I*(3/4);
    mmf7=Hsp7*Lsp7+(Bsp7*Ag7/Pg7)+Hsy7*Lsy7;
    del=MMF7-mmf7;
    if del>=0 
        Bsp=Bsp+0.0005;
    else
        Bsp=Bsp-0.0005;
    end
    display(del);
end
La7=MMF7*Bsp*Ag7/(I^2);
La=La1+4*La7;

%%Unaligned Inductance Paths 
wss=((2*pi/Ps)-Bs)*((D/2)-Lg);
wsp=Bs*((D/2)-Lg);
wrs=((2*pi/Pr)-Br)*((Do-Bry)/2);
wrp=Br*(D/2);
d7=(wrs-wsp)/2;
d8=wss*(2/pi)-d7;
%%d9=(Hr+Lg)*(2/pi)-d7;
d9=0.1*wsp;
t5=d7-Lg;
MMF1u=((Hs-(t5/2))*Tph*I)/(2*Hs);
MMF2u=((Hs-t5)*Tph*I)/(2*Hs);
MMF3u=((Hs-t5-(d8/2))*Tph*I)/(2*Hs);
MMF4u=(Tph*I)/2;
MMF5u=((Hs-d7)*Tph*I)/(2*Hs);
MMF6u=(Tph*I)/2;
MMF7u=((Hs-(t5/2))*Tph*I)/(2*Hs);
MMF8u=((Hs-(t5/2))*Tph*I)/(2*Hs);
MMF9u=(Tph*I)/2;
MMF10u=(Tph*I)/2;
Lw=Lstk;

%path 1
del=100;
Bsp1=Bsp;
while abs(del)>10
    phis1=Bsp1*Asp;
    phisy1=phis1/2;
    Bry1=phisy1/Ary;
    Bsy1=phisy1/Asy;
    Brp1=Bsp1*Asp/Arp;
    
    Hry1=interp1(B,H,Bry1,'spline');
    Hsy1=interp1(B,H,Bsy1,'spline');
    Hrp1=interp1(B,H,Brp1,'spline');
    Hsp1=interp1(B,H,Bsp1,'spline');
    
    Lsp1=Hs-(t5/2)+(Bsy/2);
    Lrp1=Hr-(t5/2)+(Bry/2);
    Lsy1=1.5*(wss+wsp);
    Lry1=1.5*(wrs+wrp);
    
    Pg1=(uo*Lstk*t5)/(2*d7);
    
    mmf1u=2*((phis1/Pg1)+(Hsp1*Lsp1)+(Hrp1*Lrp1))+0.5*((Hry1*Lry1)+(Hsy1*Lsy1));
    del=MMF1u-mmf1u;
    if del<=0
        Bsp1=Bsp1-0.00005;
    else
        Bsp1=Bsp1+0.00005;
    end
    display(del);
end
Lu1=Tph*phis1/I;

%path 2
del=100;
Bsp2=Bsp;
while abs(del)>10
    phis2=Bsp2*Asp;
    phisy2=phis2/2;
    Bry2=phisy2/Ary;
    Bsy2=phisy2/Asy;
    Brp2=Bsp2*Asp/Arp;
    
    Hry2=interp1(B,H,Bry2,'spline');
    Hsy2=interp1(B,H,Bsy2,'spline');
    Hrp2=interp1(B,H,Brp2,'spline');
    Hsp2=interp1(B,H,Bsp2,'spline');
    
    Lsp2=Hs-(t5)+(Bsy/2);
    Lrp2=Hr+(Bry/2);
    Lsy2=1.5*(wss+wsp);
    Lry2=1.5*(wrs+wrp);
    
    Pg2=0.134*uo*Lw;
    
    mmf2u=2*((phis2/Pg2)+(Hsp2*Lsp2)+(Hrp2*Lrp2))+0.5*((Hry2*Lry2)+(Hsy2*Lsy2));
    del=MMF2u-mmf2u;
    if del<=0
        Bsp2=Bsp2-0.00005;
    else
        Bsp2=Bsp2+0.00005;
    end
    display(del);
end
Lu2=Tph*phis2/I;

%path 3
del=100;
Bsp3=Bsp;
while abs(del)>50
    phis3=Bsp3*Asp;
    phisy3=phis3/2;
    Bry3=phisy3/Ary;
    Bsy3=phisy3/Asy;
    Brp3=Bsp3*Asp/Arp;
    
    Hry3=interp1(B,H,Bry3,'spline');
    Hsy3=interp1(B,H,Bsy3,'spline');
    Hrp3=interp1(B,H,Brp3,'spline');
    Hsp3=interp1(B,H,Bsp3,'spline');
    
    Lsp3=Hs-t5-(d8/2)+(Bsy/2);
    Lrp3=Hr+(Bry/2);
    Lsy3=1.5*(wss+wsp);
    Lry3=1.5*(wrs+wrp);
    
    Pg3=0.637*uo*Lw*log(1+(d8/d7));
    
    mmf3u=2*((phis3/Pg3)+(Hsp3*Lsp3)+(Hrp3*Lrp3))+0.5*((Hry3*Lry3)+(Hsy3*Lsy3));
    del=MMF3u-mmf3u;
    if del<=0
        Bsp3=Bsp3-0.00005;
    else
        Bsp3=Bsp3+0.00005;
    end
    display(del);
end
Lu3=Tph*phis3/I;

%path 4
del=100;
Bsp4=Bsp;
while abs(del)>20
    phis4=Bsp4*Asp;
    phisy4=phis4/2;
    Bry4=phisy4/Ary;
    Bsy4=phisy4/Asy;
    Brp4=Bsp4*Asp/Arp;
    
    Hry4=interp1(B,H,Bry4,'spline');
    Hsy4=interp1(B,H,Bsy4,'spline');
    Hrp4=interp1(B,H,Brp4,'spline');
    Hsp4=interp1(B,H,Bsp4,'spline');
    
    Lsp4=Hs+(Bsy/2);
    Lrp4=Hr-t5-(d9/2)+(Bry/2);
    Lsy4=1.5*(wss+wsp);
    Lry4=1.5*(wrs+wrp);
    
    Pg4=0.637*uo*Lw*log(1+(d9/d7));
    
    mmf4u=2*((phis4/Pg4)+(Hsp4*Lsp4)+(Hrp4*Lrp4))+0.5*((Hry4*Lry4)+(Hsy4*Lsy4));
    del=MMF4u-mmf4u;
    if del<=0
        Bsp4=Bsp4-0.00005;
    else
        Bsp4=Bsp4+0.00005;
    end
    display(del);
end
Lu4=Tph*phis4/I;

%path 5
del=100;
Bsp5=Bsp;
while abs(del)>20
    phis5=Bsp5*Asp;
    phisy5=phis5/2;
    Bsy5=phisy5/Asy;
    
    Hsy5=interp1(B,H,Bsy5,'spline');
    Hsp5=interp1(B,H,Bsp5,'spline');
    
    Lsp5=2*((Hs-t5-d8)/2+Bsy/2);
    Lsy5=(wss+wsp);
    
    Pg5=uo*Lw*((Hs-t5-d8)/wss);
    
    
    mmf5u=2*((phis5/Pg5)+(Hsp5*Lsp5))+0.5*(Hsy4*Lsy4);
    del=MMF5u-mmf5u;
    if del<=0
        Bsp5=Bsp5-0.00005;
    else
        Bsp5=Bsp5+0.00005;
    end
    display(del);
end
Lu5=Tph*phis5/I;

%path 6
del=100;
Bsp6=Bsp;
while abs(del)>20
    phis6=Bsp6*Asp;
    phisy6=phis6/2;
    Bry6=phisy6/Ary;
    Bsy6=phisy6/Asy;
    Brp6=Bsp6*Asp/Arp;
    
    Hry6=interp1(B,H,Bry6,'spline');
    Hsy6=interp1(B,H,Bsy6,'spline');
    Hrp6=interp1(B,H,Brp6,'spline');
    Hsp6=interp1(B,H,Bsp6,'spline');
    
    Lsp6=Hs+(Bsy/2);
    Lrp6=Bry/2;
    Lsy6=1.5*(wss+wsp);
    Lry6=(wrs+wrp);
    
    Pg6=uo*Lw*((wsp-2*d9)/(Hr+Lg));
    
    mmf6u=2*((phis6/Pg6)+(Hsp6*Lsp6)+(Hrp6*Lrp6))+0.5*((Hry6*Lry6)+(Hsy6*Lsy6));
    del=MMF6u-mmf6u;
    if del<=0
        Bsp6=Bsp6-0.00005;
    else
        Bsp6=Bsp6+0.00005;
    end
    display(del);
end
Lu6=Tph*phis6/I;

%path 7
del=100;
Bsp7=Bsp;
while abs(del)>20
    phis7=Bsp7*Asp;
    phisy7=phis7/2;
    Bry7=phisy7/Ary;
    Bsy7=phisy7/Asy;
    Brp7=Bsp7*Asp/Arp;
    
    Hry7=interp1(B,H,Bry7,'spline');
    Hsy7=interp1(B,H,Bsy7,'spline');
    Hrp7=interp1(B,H,Brp7,'spline');
    Hsp7=interp1(B,H,Bsp7,'spline');
    
    Lsp7=Hs-(t5/2)+(Bsy/2);
    Lrp7=Hr-(t5/2)+(Bry/2);
    Lsy7=1.5*(wss+wsp);
    Lry7=1.5*(wrs+wrp);
    
    Pg7=uo*0.134*t5;
    
    mmf7u=2*((phis7/Pg7)+(Hsp7*Lsp7)+(Hrp7*Lrp7))+0.5*((Hry7*Lry7)+(Hsy7*Lsy7));
    del=MMF7u-mmf7u;
    if del<=0
        Bsp7=Bsp7-0.00005;
    else
        Bsp7=Bsp7+0.00005;
    end
    display(del);
end
Lu7=Tph*phis7/I;

%path 8
del=100;
Bsp8=Bsp;
while abs(del)>20
    phis8=Bsp8*Asp;
    phisy8=phis8/2;
    Bry8=phisy8/Ary;
    Bsy8=phisy8/Asy;
    Brp8=Bsp8*Asp/Arp;
    
    Hry8=interp1(B,H,Bry8,'spline');
    Hsy8=interp1(B,H,Bsy8,'spline');
    Hrp8=interp1(B,H,Brp8,'spline');
    Hsp8=interp1(B,H,Bsp8,'spline');
    
    Lsp8=Hs-(t5/2)+(Bsy/2);
    Lrp8=Hr-(t5/2)+(Bry/2);
    Lsy8=1.5*(wss+wsp);
    Lry8=1.5*(wrs+wrp);
    
    Pg8=uo*0.318*(t5/(1+((2*d7)/(d8+d9))));
    
    mmf8u=2*((phis8/Pg8)+(Hsp8*Lsp8)+(Hrp8*Lrp8))+0.5*((Hry8*Lry8)+(Hsy8*Lsy8));
    del=MMF8u-mmf8u;
    if del<=0
        Bsp8=Bsp8-0.00001;
    else
        Bsp8=Bsp8+0.00001;
    end
    display(del);
end
Lu8=Tph*phis8/I;

%path 9
del=100;
Bsp9=Bsp;
while abs(del)>20
    phis9=Bsp9*Asp;
    phisy9=phis9/2;
    Bry9=phisy9/Ary;
    Bsy9=phisy9/Asy;
    Brp9=Bsp9*Asp/Arp;
    
    Hry9=interp1(B,H,Bry9,'spline');
    Hsy9=interp1(B,H,Bsy9,'spline');
    Hrp9=interp1(B,H,Brp9,'spline');
    Hsp9=interp1(B,H,Bsp9,'spline');
    
    Lsp9=Hs+(Bsy/2);
    Lrp9=(Bry/2);
    Lsy9=1.5*(wss+wsp);
    Lry9=(wrs+wrp);
    
    Pg9=uo*0.268*(wsp-2*d9);
    
    mmf9u=2*((phis9/Pg9)+(Hsp9*Lsp9)+(Hrp9*Lrp9))+0.5*((Hry9*Lry9)+(Hsy9*Lsy9));
    del=MMF9u-mmf9u;
    if del<=0
        Bsp9=Bsp9-0.00005;
    else
        Bsp9=Bsp9+0.00005;
    end
    display(del);
end
Lu9=Tph*phis9/I;

%path 10
del=100;
Bsp10=Bsp;
while abs(del)>20
    phis10=Bsp10*Asp;
    phisy10=phis10/2;
    Bry10=phisy10/Ary;
    Bsy10=phisy10/Asy;
    Brp10=Bsp10*Asp/Arp;
    
    Hry10=interp1(B,H,Bry10,'spline');
    Hsy10=interp1(B,H,Bsy10,'spline');
    Hrp10=interp1(B,H,Brp10,'spline');
    Hsp10=interp1(B,H,Bsp10,'spline');
    
    Lsp10=Hs-(d9/2)+(Bsy/2);
    Lrp10=(Bry/2)-(d9/2);
    Lsy10=1.5*(wss+wsp);
    Lry10=(wrs+wrp);
    
    beta1=(Hr+Lg)/d9;
    
    Pg10=uo*0.637*((wsp-2*d9)/(1+beta1));
    
    mmf10u=2*((phis10/Pg10)+(Hsp10*Lsp10)+(Hrp10*Lrp10))+0.5*((Hry10*Lry10)+(Hsy10*Lsy10));
    del=MMF10u-mmf10u;
    if del<=0
        Bsp10=Bsp10-0.00005;
    else
        Bsp10=Bsp10+0.00005;
    end
    display(del);
end
Lu10=Tph*phis10/I;
Lu=Lu1+2*(Lu2+Lu3+Lu4+Lu5)+4*(Lu6+Lu7+Lu8+Lu9+Lu10);

%%calculation of Flux linkage
n=15;
in=I/n;
ip=in:in:I;
for i=1:1:n
    MMFt(i)=Tph*ip(i);
end
for i=1:1:n
    Bsp1=Bsp;
    del=100;
    while abs(del)>15
        Bg1=Bsp1*Asp/Ag;
        Brp1=Bsp1*Asp/Arp;
        phis1=Bsp1*Asp;
        phisy1=phis1/2;
        Bys1=phisy1/Asy;
        Byr1=phisy1/Ary;
            
        Hsp1=interp1(B,H,Bsp1,'spline');
        Hrp1=interp1(B,H,Brp1,'spline');
        Hry1=interp1(B,H,Byr1,'spline');
        Hsy1=interp1(B,H,Bys1,'spline');
        Hg1=Bg1/uo;
        
        Lsp=Hs+Bsy/2;
        Lrp=Hr+Bry/2;
        Lsy=(pi/2)*(Dsh+Bsy);
        Lry=(pi/2)*(Do+Bry);
        
        mmft=2*(Hsp1*Lsp+Hrp1*Lrp+Hg1*Lg)+0.5*(Hsy1*Lsy+Hry1*Lry);
        del=MMFt(i)-mmft;
    if del<=0
        Bsp1=Bsp1-0.00005;
    else
        Bsp1=Bsp1+0.00005;
    end
    display(del);
    end
Lflux(i)=phis1;
Lat(i)=Tph*Lflux(i)/ip(i);
Lambdaa(i)=Lat(i)*ip(i);
Lambdau(i)=Lu*ip(i);
end

%%Plot of Flux linkage
plot(ip(),Lambdaa());
hold on;
plot(ip(),Lambdau());

%%Calculation of average Torque
LAMDAA=0;
for i=1:1:(n-1)
    LAMDAA=LAMDAA+Lambdaa(i);
end
Wal=in*(LAMDAA)+(Lambdaa(n)*in*0.5);
Wul=0.5*I*I*Lu;
W=Wal-Wul;
Tav=(W*Ps*Pr)/(4*pi);
display('The average torque is :');
display(Tav);

%%Design Check
if Tr>Tav
    display('The design dimensions have to be iterated NOT A FEASIBLE DESIGN');
else
    display('The dimensions meets the torque:');
end

%%Display variables
display('The cross-section of winding required is:');
display(Ac);
display('The diameter of the winding will be:');
display(dw);