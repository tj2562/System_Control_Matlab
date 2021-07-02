

t = 0:0.01:1;
px = 1.5 + 0.6 * 0.5 * (1-cos(pi*t/1.0));
py = 1.0 + 0.4 * 0.5 * (1-cos(pi*t/1.0));

theta2 = acos((py.^2 + (px - 1).^2 -2)./2);
theta1 = atan2((-sin(theta2).*(px-1) + 1+cos(theta2).*py)./(1+cos(theta2).^2 - sin(theta2).^2) ,(1+cos(theta2).*(px-1) + sin(theta2) .* py)./(1+cos(theta2).^2 - sin(theta2).^2));
theta3 = 2*pi- theta2 - theta1;

figure(1)
title('Joint Angle')
hold on
xlabel('t[sec]') 
hold on
ylabel('Angle[rad]') 
hold on
plot(t,theta2,'-')
hold on
plot(t,theta1,'-')
hold on
plot(t,theta3,'-')
hold on
