T = input('Enter Time-period of Sin wave (in Sec)');
w = 2*pi/T;   %Calculating angular frequency of input Sinusoid
t= 0:0.01:20; %Time-step = 0.01 sec, Total Time = 20sec
G1 = tf([4 5],[6 8]); 
G2 = tf([3],[1 2 3]);
G  = G1*G2; %Overall TF
R  = tf([w],[1 0 w^2]); %Laplace transform of Input(Sinusoidal) excitation 
C  = R*G; %Output Responce in 's' domain
[A,B]=impulse(C*20,t); %Output Responce is scaled by 20
[D,E]=impulse(R/3,t);  %Input responce is scaled by 0.333
plot(B,D,B,A),title(' Input excitation and the Output response'),xlabel('Time(Sec)'),ylabel('Magnitude');
legend('Input signal(\times 0.333)','Output Responce(\times 20)')