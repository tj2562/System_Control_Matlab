t = 0:0.01:1;
px = 1.5 + 0.6 .* 0.5 .* (1-cos(pi.*t/1.0));
py = 1.0 + 0.4 .* 0.5 .* (1-cos(pi.*t/1.0));
g = 9.81;

theta2 = acos((py.^2 + (px - 1).^2 -2)./2);
theta1 = atan2((-sin(theta2).*(px-1) + 1+cos(theta2).*py)./(1+cos(theta2).^2 - sin(theta2).^2) ,(1+cos(theta2).*(px-1) + sin(theta2) .* py)./(1+cos(theta2).^2 - sin(theta2).^2));
theta3 = 2.*pi- theta2 - theta1;

t1_v = 1 : 101;
t1_a = 1 : 101;
t2_v = 1 : 101;
t2_a = 1 : 101;
t3_v = 1 : 101;
t3_a = 1 : 101;

for i = 2:101
    t1_v(i) = (theta1(i) - theta1(i-1))/0.01;
     t2_v(i) = (theta2(i) - theta2(i-1))/0.01;
      t3_v(i) = (theta3(i) - theta3(i-1))/0.01;
end

t1_v(1) = 0
t2_v(1) = 0
t3_v(1) = 0

for i = 2:101
    t1_a(i) = (t1_v(i) - t1_v(i-1))/0.01;
     t2_a(i) = (t2_v(i) - t2_v(i-1))/0.01;
      t3_a(i) = (t3_v(i) - t3_v(i-1))/0.01;
end

for i = 1:99
    t1_a(i) = t1_a(i+2);
      t2_a(i) = t2_a(i+2);
       t3_a(i) = t3_a(i+2);
end

m1 = 10;
m2 = 5;
m3 = 3;

L1 = 0.5;
L2 = 0.5;
L3 = 0.5;

a1 = 1;
a2 = 1;
a3 = 1;

I1 = m1.*L1/12;
I2 = m2.*L2/12;
I3 = m3.*L3/12;

M11 = m1.*L1^2 + I1 +m2.*a1^2 + m2.*L2^2 + 2.*m2.*a1.*L2.*cos(theta2) + I2 + m3.*a1^2 + m3.*a2^2 + m3.*L3^2 + m3.*a1.*a2.*2.*cos(theta2) + m3.*a2.*L3.*2.*cos(theta3 + theta2) + m3.*a2.*L3.*2.*cos(theta3) + I3;
M12 = m2.*L2^2 + m2.*a1.*L2.*cos(theta2) + I2 + m3.*a2^2 + m3.*L3^2 + m3.*a1.*a2.*cos(theta2) + m3.*a2.*L3.*2.*cos(theta3) + m3.*a1.*L3.*cos(theta2+theta3) + I3;
M13 = m3.*L3^2 + m3.*a2.*L3.*cos(theta3) + m3.*a1.*L3.*cos(theta2+theta3) + I3;
M21 = m2.*L2^2 + I3 + m2.*a1.*L2.*cos(theta2) + I2 + m3.*a2^2 + m3.*L3^2 + m3.*a1.*a2.*cos(theta2) + 2.*m3.*a2.*L3.*cos(theta3) + m3.*a1.*L3.*cos(theta2+theta3);
M22 = m2.*L3^2 + I3 + I2 + m3.*a2^2 + m3.*L3^2 +2.*m3.*a2.*L3.*cos(theta3);
M23 = m3.*L3^2 + m3.*a2.*L3.*cos(theta3) + I3;
M31 = m3.*L3^2 + m3.*a2.*L3.*cos(theta3) + m3.*a1.*L3.*cos(theta2+theta3) + I3;
M32 = m3.*L3^2 + m3.*a2.*L3.*cos(theta3) +I3;
M33 = m3.*L3^2 + I3;
A112 = -m2.*a1.*L2.*2.*sin(theta2) - m3.*a1.*a2.*2.*sin(theta2) - 2.*m3.*a1.*L3.*sin(theta2+theta3);
A123 = -m3.*a2.*L3.*2.*sin(theta3) + -2.*m3.*a1.*L3.*sin(theta2+theta3);
A113 = -2.*m3.*a2.*L3.*sin(theta3) - 2.*m3.*a1.*L3.*sin(theta2+theta3);
A122 = -m2.*a1.*L3.*sin(theta3) - m3.*a1.*a2.*sin(theta2) - m3.*a1.*L3.*sin(theta2+theta3) ;
A133 = -m3.*a1.*L3.*sin(theta2+theta3) -m3.*a2.*L3.*sin(theta3);
A211 = m2.*a1.*L2.*sin(theta2) + m3.*a1.*a2.*sin(theta2) + m3.*a1.*L3.*sin(theta2+theta3);
A233 = -m3.*a2.*L3.*sin(theta3);
A212 = 0;
A223 = -m3.*a2.*L3.*2.*sin(theta3);
A213 = -2.*m3.*a2.*L3.*sin(theta3);
A311 = m3.*a2.*L3.*sin(theta3) + m3.*a1.*L3.*sin(theta2+theta3);
A322 = m3.*a2.*L3.*sin(theta3);
A312 = 2.*m3.*a2.*L3.*sin(theta3);
A323 = 0;
A313 = 0;

T1 = 1:101;
T2 = 1:101;
T3 = 1:101;

T1 = M11.*t1_a + M12.*t2_a + M13.*t3_a + A112.*t1_v.*t2_v + A123.*t2_v.*t3_v + A113.*t1_v.*t3_v + A133.*t3_v.*t3_v + A122.*t2_v.*t2_v + m1.*g.*L1.*cos(theta1) + m2.*g.*(a1.*cos(theta1) + L2.*cos(theta1+theta2)) + m3.*g.*(a1.*cos(theta1) + L2.*cos(theta1+theta2) + L3.*cos(theta1 + theta2 + theta3))
T2 = M21.*t1_a + M22.*t2_a + M23.*t3_a + A211.*t1_v.*t1_v + A233.*t2_v.*t2_v + A212.*t1_v.*t2_v + A223.*t2_v.*t3_v + A213.*t1_v.*t3_v +  m2.*g.*L2.*cos(theta2 + theta1) + m3.*g.*(a2.*cos(theta1 + theta2)) + L3.*cos(cos(theta1 + theta2 + theta3))
T3 = M31.*t1_a + M32.*t2_a + M33.*t3_a + A311.*t1_v.*t1_v + A322.*t2_v.*t2_v + A312.*t1_v.*t2_v + A323.*t2_v.*t3_v + A313.*t1_v.*t3_v + m3.*g.*L3.*cos(theta1 + theta2 + theta3)

P1 = abs(t1_v .* T1);
P2 = abs(t2_v .* T2);
P3 = abs(t3_v .* T3);


xlabel('t[sec]') 
hold on
ylabel('Power[Watt]') 
plot(t,P1,'-')
hold on
plot(t,P2,'-')
hold on
plot(t,P3,'-')
hold on









