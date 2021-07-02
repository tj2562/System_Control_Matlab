syms t
initQ = [0 0 0];
finalQ = [-0.7854, 1.5708, 2.3562];
%theta = 0.5*((initQ - finalQ)*cos(pi*t) + initQ + finalQ)
figure(1)
xlabel('time')
ylabel('Joint Velocity')    
t = 0:0.01:1;
theta1 = 0.5*((initQ(1) - finalQ(1))*cos(pi*t) + initQ(1) + finalQ(1))

   

theta2 = 0.5*((initQ(2) - finalQ(2))*cos(pi*t) + initQ(2) + finalQ(2))



theta3 = 0.5*((initQ(3) - finalQ(3))*cos(pi*t) + initQ(3) + finalQ(3))


for i = 2:101
    t1_v(i) = (theta1(i) - theta1(i-1))/0.01;
     t2_v(i) = (theta2(i) - theta2(i-1))/0.01;
      t3_v(i) = (theta3(i) - theta3(i-1))/0.01;
end

t1_v(1) = 0
t2_v(1) = 0
t3_v(1) = 0

min(t1_v)
max(t2_v)
max(t3_v)

xlabel('t[sec]') 
hold on
ylabel('Angular Velocity [rad/s]') 
plot(t,t1_v,'-', 'Color', 'Red')
hold on
plot(t,t2_v,'-', 'Color', 'Green')
hold on
plot(t,t3_v,'-', 'Color', 'Blue')
hold on

legend('Theta1', 'Theta2', 'Theta3')
