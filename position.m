t = 0:0.01:1;
px = 1.5 + 0.6 * 0.5 * (1-cos(pi*t/1.0));
py = 1.0 + 0.4 * 0.5 * (1-cos(pi*t/1.0));

theta2 = acos((py.^2 + (px - 1).^2 -2)./2);
theta1 = atan2((-sin(theta2).*(px-1) + 1+cos(theta2).*py)./(1+cos(theta2).^2 - sin(theta2).^2) ,(1+cos(theta2).*(px-1) + sin(theta2) .* py)./(1+cos(theta2).^2 - sin(theta2).^2));
theta3 = 2*pi- theta2 - theta1;

p1x = 1.5 + cos(theta1);
p1y = 1 + sin(theta1);
p2x = p1x + cos(theta2 + theta1);
p2y = p1y + sin(theta2 + theta1)



p0x = 1.5;
p0y = 1;

Px = [p0x,p1x(100),p2x(100),px(100)]
Py = [p0y,p1y(100),p2y(100),py(100)]

line(Px, Py)
hold on