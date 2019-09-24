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
Display
