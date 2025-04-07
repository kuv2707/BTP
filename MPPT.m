
function Vref = MPPT(V_PV,I_PV)
Vrefmax=215;
Vrefmin=210;
Vrefinit=213;
deltaVref=0.001;
persistent Vold Pold Vrefold;
dataType = 'double';
if isempty (Vold)
Vold=0;
Pold=0;
Vrefold = Vrefinit;
end
P=V_PV*I_PV;
dV = V_PV-Vold;
dP = P-Pold;
if dP~=0
if dP<0
if dV<0
Vref = Vrefold+deltaVref;
else
Vref = Vrefold-deltaVref;
end
else
if dV>0
Vref = Vrefold-deltaVref;
else
Vref = Vrefold+deltaVref;
end
end
else
Vref = Vrefold;
end
if Vref>=Vrefmax || Vref<=Vrefmin
Vref=Vrefold;
end
Vrefold = Vref;
Vold = V_PV;
Pold = P;