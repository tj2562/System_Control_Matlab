syms t
initQ = [0 0 0];
finalQ = [-0.7854, 1.5708, 2.3562];
%theta = 0.5*((initQ - finalQ)*cos(pi*t) + initQ + finalQ)
figure(1)
xlabel('time')
ylabel('Joint Angle')    
t = 0:0.01:1;
py1 = 0.5*((initQ(1) - finalQ(1))*cos(pi*t) + initQ(1) + finalQ(1))
plot(t,py1,'o', 'Color', 'Red')
hold on
   

py2 = 0.5*((initQ(2) - finalQ(2))*cos(pi*t) + initQ(2) + finalQ(2))
plot(t,py2,'o', 'Color', 'Green')
hold on


py3 = 0.5*((initQ(3) - finalQ(3))*cos(pi*t) + initQ(3) + finalQ(3))
plot(t,py3,'o', 'Color', 'Blue')
hold on

figure(2)    
xlabel('x')
ylabel('y')    
posy = 24.5*cos(py1) + 58*cos(py1+py2) +30*cos(py1+py2+py3)
posx = 24.5*sin(py1) + 58*sin(py1+py2) +30*sin(py1+py2+py3)
plot(posx,posy,'o', 'Color', 'Blue')
hold on
    