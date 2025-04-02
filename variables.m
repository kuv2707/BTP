d=0.5;
f=10000;
vin=25;
vout=48;
d_vc=0.05*vout;
p=2000;
io=p/vout;
d_il=0.05*io;
L=(d*vin)/(f*d_il);
c=d*io/(d_vc*f);
r=0.01;

%% --- virtual's parameters
cv = 1;
Tf = 0.05;
gv = 0.1;

%% -----

ttt = tf([cv 0],[Tf 1]);
bode(ttt)