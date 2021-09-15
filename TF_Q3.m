J = input('Enter Moment of inertia of the rotor (J)(in kg.m^2/S^2)_');
b = input('Enter Damping ratio of the mechanical system (b)(in Nms)_');
Kb = input('Enter Back EMF constant(Kb)(in Nm/A)_');
Kt = input('Enter Motor Torque Constant(Kt)(in Nm/A)_');
R = input('Enter Electric resistance (R)(in ohm)_');
L = input('Enter Electric inductance (L)(H)_');

t = 0:0.01:3; %Time-step = 0.1 sec, Total Time = 3sec
G = tf([Kt],[J*L (J*R+b*L) (b*R+Kb*Kt)]); %Generating Openloop TF
kp = [1 10 100]; %taking Kp=1,10,100;
r = ones(size(t)); %Constructing a unit step vactor

G1 = G*kp(1); %Open loop overall gain
GO1 = feedback(G1,1); %Closeloop overall gain of system
[C1,t1] = step(GO1,t); %Storing output response to C1 vactor
P1=stepinfo(GO1); %Getting characteristic informations of Output
disp('For Kp=10_');
disp('SettlingTime (in sec)_'); 
disp(P1.SettlingTime);%Displaying Settling time
disp('Over-shoot (%)_');
disp(P1.Overshoot);%Displaying (%)Overshoot
disp('Steady state error (%)_');
disp(abs((1-P1.SettlingMax))*100);%Displaying (%)Stadystaty state error

G2 = G*kp(2);
GO2 = feedback(G2,1);
[C2,t2] = step(GO2,t);
P2=stepinfo(GO2);
disp('For Kp=10_');
disp('SettlingTime (in sec)_'); 
disp(P2.SettlingTime);
disp('Over-shoot (%)_');
disp(P2.Overshoot);
disp('Steady state error (%)_');
disp(abs((1-P2.SettlingMax))*100);

G3 = G*kp(3);
GO3 = feedback(G3,1);
[C3,t3] = step(GO3,t);
P3=stepinfo(GO3);
disp('For Kp=10_');
disp('SettlingTime (in sec)_'); 
disp(P3.SettlingTime);
disp('Over-shoot (%)_');
disp(P3.Overshoot);
disp('Steady state error (%)_');
disp((1-P3.SettlingMax)*100);

plot(t,r,t1,C1,t2,C2,t3,C3); %ploting all responses
title('Output Responce vs Time'),xlabel('Time(in sec)'),ylabel('Angular Frequency (rad/sec)'),
legend('Ideal step response','Responce at Kp=1','Responce at Kp=10','Responce at Kp=100');

%As we increase proportional gain Kp, Upto a certain valu, Stady state error
%reduced and system change it self towards critical damping from Overdamped.
%for a particular value of Kb system became critiaclly damped and
%stady state error become minimum, but if we still increase Kb, system will
%become under damped, and give overshoot, increase on increasing Kb.
%