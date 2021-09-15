J = input('Enter Moment of inertia of the rotor (J)(in kg.m^2/S^2)_');
b = input('Enter Damping ratio of the mechanical system (b)(in Nms)_');
Kb = input('Enter Back EMF constant(Kb)(in Nm/A)_');
Kt = input('Enter Motor Torque Constant(Kt)(in Nm/A)_');
R = input('Enter Electric resistance (R)(in ohm)_');
L = input('Enter Electric inductance (L)(H)_');

t = 0:0.01:3;% Time-step = 0.1 sec, Total Time = 3sec
Kp=15;  %Taking proportional Constant 15
Kd=0.1; %Taking Differential Constant 15
Ki=0.1:0.1:200; %Varing Integral Constant From 0.1 to 200 with step of 0.1

G = tf([Kt],[J*L (J*R+b*L) (b*R+Kb*Kt)]); %Generating Openloop TF
r = ones(size(t)); %Constructing a unit step vactor
    
    for j=1:2000
           PID = tf([Kd Kp Ki(j)],[1,0]); %TF of PID controller
           GO = PID*G; %Overall open loop gain
           GO1 = feedback(GO,1); %Overall closed loop gain
           P = stepinfo(GO1); %Getting characteristic informations of Output
          if P.SettlingTime<2 && P.Overshoot<0.05 && (((1-P.SettlingMax))*100)<1 %Checking Desire condition
              disp('Value of Proportional Constant(Kp)_');
              disp(Kp);
              disp('Value of Differential Constant(Kd)_');
              disp(Kd);
              disp('Value of Intrigal Constant Constant(Ki)_');
              disp(Ki(j));
              disp('SettlingTime (in sec)_'); 
              disp(P.SettlingTime);
              disp('Over-shoot (%)_');
              disp(P.Overshoot);
              disp('Steady state error (%)_');
              disp(abs((1-P.SettlingMax))*100);
              [C,t] = step(GO1,t); %Storing output response to C vactor
              plot(t,C,t,r),
              title('Step Responce'),xlabel('Time (in sec)'),ylabel('Angular Frequency (rad/sec)'),
              legend('Controlled Response','Ideal Responce');
              break;
          end
     end
    

               
