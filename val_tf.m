% clc;
% clear all;

% r=0.02;
% c=62.5e-6;
% L = 312.5e-6;
% d = 0.5;

% vout = 10;
% io = 2;

A=[-r/L -(1-d)/L;
      (1-d)/c 0;];

B2 = [vout/L; 
         -io/c; ];

C = eye(2,2);

D = [0;
    0;];

statespace = ss(A, B2, C,D);

transferfunc = tf(statespace);

gid = transferfunc(1);
gvd=transferfunc(2);
gvi=minreal(gvd/gid);
[cc,infocc]=pidtune(gid,'pi',1250)

gcc=feedback(cc*gid,1);
gpvc=gcc*gvi;

[vc,infovc]=pidtune(gpvc,'pi',250);

gpcl=feedback(vc*gpvc,1)


