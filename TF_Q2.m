J = input('Enter Moment of inertia of the rotor (J)(in kg.m^2/S^2)_');
b = input('Enter Damping ratio of the mechanical system (b)(in Nms)_');
Kb = input('Enter Back EMF constant(Kb)(in Nm/A)_');
Kt = input('Enter Motor Torque Constant(Kt)(in Nm/A)_');
R = input('Enter Electric resistance (R)(in ohm)_');
L = input('Enter Electric inductance (L)(H)_');
t = 0:0.1:3; %Time-step = 0.1 sec, Total Time = 3sec
G = tf([Kt],[J*L (J*R+b*L) (b*R+Kb*Kt)]); %Generating TF
[N D] = tfdata(G); %Getting co-efficients of numarator and denominator
step(G,t); %Getting step response of system
title('Step Responce'),xlabel('Time (in sec)'),ylabel('Angular Frequency (rad/sec)');
N = cell2mat(N); %converting cell matrix into normal matrix
D = cell2mat(D);
dr = D(2)/(2*sqrt(D(3)*D(1))); %calculating Damping Ratio
if dr<1
     disp('step response characteristics of the system are_');
     disp('System is Underdamped');
     p = stepinfo(G); %Getting characteristic informations of Output
elseif dr==1  
   disp('step response characteristics of the system are_');
   disp('System is Critically damped');
   p=stepinfo(G);
else
   disp('step response characteristics of the system are_');
   disp('System is Overdamped');
   p=stepinfo(G);
end
   disp('Damping Ratio_');
   disp(dr);
   disp('Angular Frequency (in rad/s)_');
   disp(p.SettlingMax); %Getting values from p struct
   disp('SettlingTime (in sec)_');
   disp(p.SettlingTime);
   disp('Over-shoot (%)_');
   disp(p.Overshoot);
   disp('Steady state error (%)_');
   disp((1-p.SettlingMax)*100);
% Answer of the Question:-
%  According to our problem the desire conditions of motor are:-
% 1. Desired angular speed of motor is 1 rad/s.
% 2. Settling time should be less than 2 s.
% 3. Overshoot should be less than 5%.
% 4. Steady-state error should be less than 1%
% But as per result, the system over pass 3 avove conditions, i.e angular frequency(Ideally 1 rad/s, prctically 0.0998 rad/s),
% settling time(Ideally 2 sec, prctically 2.0652 sec), Steady-state error (Ideally <1%, prctically 90.12%);
% It is obvious to have such over pass performance for a Open loop controlled system, since the accuracy of the system is depends on te accuracy of source only.