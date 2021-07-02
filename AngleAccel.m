t = 0:0.01:1;
px = 1.5 + 0.6 * 0.5 * (1-cos(pi*t/1.0));
py = 1.0 + 0.4 * 0.5 * (1-cos(pi*t/1.0));

theta2 = acos((py.^2 + (px - 1).^2 -2)./2);
theta1 = atan2((-sin(theta2).*(px-1) + 1+cos(theta2).*py)./(1+cos(theta2).^2 - sin(theta2).^2) ,(1+cos(theta2).*(px-1) + sin(theta2) .* py)./(1+cos(theta2).^2 - sin(theta2).^2));
theta3 = 2*pi- theta2 - theta1;

p2x = px-1;
p2y = py;

p1x = p2x - cos(theta2 + theta1);
p1y = p2y - sin(theta2 + theta1);

p0x = 1.5;
p0y = 1;




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
xlabel('t[sec]') 
hold on
ylabel('Angular Acceleration [deg/s^2]') 
plot(t,t1_a,'-')
hold on
plot(t,t2_a,'-')
hold on
plot(t,t3_a,'-')
hold on











