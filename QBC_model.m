Vin = 48;
Vout = 800;
D = 1 - (Vin/Vout)^0.5;
f = 100000;

R = 80;
Io = Vout/R;

%%Ripple percentage
ripple_iL1 = 0.2;
ripple_iL2 = 0.2;
ripple_vC1 = 0.02;
ripple_vC2 = 0.02;

del_iL1 = Io*ripple_iL1/(1-D)^2;
del_iL2 = Io*ripple_iL2/(1-D);
del_vC1 = Vin*ripple_vC1/(1-D);
del_vC2 = Vin*ripple_vC2/(1-D);

L1 = Vout*(1-D)^2*D/(del_iL1*f);
L2 =  Vout*(1-D)*D/(del_iL2*f);
C1 = D*Io/(f*(1-D)*del_vC1);
C2 = D*Io/(del_vC2*f);

A = [0 0 -(1-D)/L1 0;
     0 0 1/L2 -(1-D)/L2;
     (1-D)/C1 -1/C2 0 0;
     0 (1-D)/C2 0 -1/(R*C2)
     ];

eig(A)