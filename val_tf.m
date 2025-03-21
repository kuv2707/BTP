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
    
B1 = [0 -1/c]'; % for disturbance

C = eye(2,2);

D = [0;
    0;];

statespace = ss(A, B2, C,D);

transferfunc = tf(statespace);

gid = transferfunc(1);
gvd=transferfunc(2);
gvi=minreal(gvd/gid);
[cc,infocc]=pidtune(gid,'pi',1250);

gcc=feedback(cc*gid,1);
gpvc=gcc*gvi; % current wala

[vc,infovc]=pidtune(gpvc,'pi',250);

gpcl=feedback(vc*gpvc,1); % voltage wala, net tf




%% ---- Considering disturbance
disturb_ss = ss(A, B1, C, D);
disturb_tf = tf(disturb_ss);

% bode(disturb_tf(1))

gilid = disturb_tf(1);
gvid = disturb_tf(2);

golcc = cc*gid;
G1 = gilid/golcc;

G2 = 

bode(G2)