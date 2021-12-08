import numpy as np

Rn = 65 #Ohms
Rp = 130 #Ohms
Cl = 20e-12 #F
Vcc = 4.5 #V
VH = 3.5 #V
VL = 1.5 #V
#Fall Time
tH = -Rn*Cl*np.log(VH/Vcc)
tL = -Rn*Cl*np.log(VL/Vcc)
tf = tL - tH
print(f'Fall Time: t_{VH} = {np.round(tH*1e9,3)}ns, t_{VL} = {np.round(tL*1e9,3)}ns, tf = {np.round(tf*1e9,3)}ns')
#Rise Time
tH = -Rp*Cl*np.log(1 - VH/Vcc)
tL = -Rp*Cl*np.log(1 - VL/Vcc)
tr = tH - tL
print(f'Rise Time: t_{VH} = {np.round(tH*1e9,3)}ns, t_{VL} = {np.round(tL*1e9,3)}ns, tr = {np.round(tr*1e9,3)}ns')