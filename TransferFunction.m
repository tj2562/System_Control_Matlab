clc
%angle
syms a1
syms a2
syms a3
syms a4
syms a5
syms a6
syms d1
syms d2
syms d3
syms d4
syms d5
syms d6

syms theta1
syms theta2
syms theta3
syms theta4
syms theta5
syms theta6

syms alpha1
syms alpha2
syms alpha3
syms alpha4
syms alpha5
syms alpha6
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 dx dy dz
x = 0:6;y= 0:6;z= 0:6;
theta1
theta2
H = [r11 r12 r13 dx; r21 r22 r23 dy; r31 r32 r33 dz ; 0 0 0 1];
T1 =  Rotx([90])  * Rotz([90]);
T2 = Transx(20) * Rotz([theta2]) ;
a1 = Rotz([theta1]) * Transx([24.5])
a2 = Rotz([theta2]) * Transx([58])
a3 = Rotz([theta3]) * Transx([30]) *Rotx([90]);
((a1)^(-1)) * H;
a1 * a2 * a3
function T = Transz(P)
%DH-Transformation
%P = [theta d a alpha]
T = [1 0 0 0;
     0 1 0 0;
     0 0 1 P(1);
     0 0 0 1];
end
function T = Transy(P)
%DH-Transformation
%P = [theta d a alpha]
T = [1 0 0 0;
     0 1 0 P(1);
     0 0 1 0;
     0 0 0 1];
end
function T = Transx(P)
%DH-Transformation
%P = [theta d a alpha]
T = [1 0 0 P(1);
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];
end
function T = Rotx(P)
T = [1     0              0  0;
     0 cosd(P(1)) -sind(P(1)) 0;
     0 sind(P(1)) cosd(P(1))  0;
     0     0              0  1];
end
function T = Roty(P)
T = [cos(P(1))  0  sin(P(1))  0;
     0          1     0         0;
     -sin(P(1))  0   cos(P(1))  0;
     0          0           0   1];
end
function T = Rotz(P)
T = [cos(P(1)) -sin(P(1)) 0  0;
     sin(P(1)) cos(P(1))  0  0;
     0         0           1  0;
     0         0           0  1];
end



