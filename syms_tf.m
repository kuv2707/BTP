clear all;
clc;
syms r L D C i_lo v_dco s
A=[-r/L -(1-D)/L;
      (1-D)/C 0;];
B2 = [v_dco/L; 
         -i_lo/C; ];

B1 = [0;
    -1/C];
I = eye(2,2);

% TFs = I*(s*I - A)^-1 * B2;
TFs = I * (s* I - A)^-1 * B1;

Gilid = TFs(1);
Gvid = TFs(2);

% G_ild = TFs(1); % i_l / d
% G_vd = TFs(2); % v_dc / d
% G_vi = G_vd / G_ild;
% syms kpi kii
% PI_c = kpi + kii/s;
% G_ccl = PI_c * G_ild;
% TF_ccl = G_ccl / (1 + G_ccl);
% syms kpv kiv
% PI_v = kpv + kiv/s;
% G_vcl = PI_v * TF_ccl * G_vi;
% TF_vcl = G_vcl / (1 + G_vcl);
% a = subs(TF_vcl, r, 0.0000001);
% b = subs(a,L, 33*10^-6);
% c = subs(b, C, 100*10^-6);
% ddd = subs(c, )s



% simscape