
a = input('Enter Passband ripple_');
b = input('Enter Stopband ripple_');
c = input('Enter Passband edge frequency (in Hz)_');
d = input('Enter Stopband edge frequency (in Hz)_');
e = input('Enter Sampling frequency (in Hz)_');
wp = pi*c/e; %Normalized Frequency = Normal Frequency * pi / Sampling Frequency
ws = pi*d/e;
pb = [wp ws]; %Pass band frequency
sb = [wp-0.1 ws+0.1]; %Stop band frequency
t = 0:0.001:pi; % Taking array in Continuous Time domain

%For Low Pass
[N,wn] = buttord(wp,ws,a,b);
% N = The order of the lowest order irr Butterworth filter.
% wn = the Butterworth natural frequency (or,the "3 dB frequency").
[B,A] = butter(N,wn,'low');
%designs an Nth order lowpass digital Butterworth filter and returns the filter coefficients in length N+1 vectors B (numerator) and A (denominator).
[h,n] = freqz(B,A,t);
%Getting N-point complex frequency response vector h and the N-point frequency vector n in radians/sample of the filter.
subplot(4,2,1),plot(n/pi,angle(h)*180/pi),title('Low pass Butterworth Phase response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Phase(Degree)');
%Ploting of Phase plot.
subplot(4,2,2),plot(n/pi,20*log(abs(h))),title('Low pass Butterworth Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
%Ploting of Magnitude plot.

%For High Pass
[N,wn] = buttord(wp,ws,a,b);
[B,A] = butter(N,wn,'high'); %designs a highpass filter.
[h,n] = freqz(B,A,t);
subplot(4,2,3),plot(n/pi,angle(h)*180/pi),title('High pass Butterworth Phase response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Phase(Degree)');
subplot(4,2,4),plot(n/pi,20*log(abs(h))),title('High pass Butterworth Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');

%For Bandstop
[N,wn] = buttord(pb,sb,a,b);
[B,A] = butter(N,wn,'stop'); %designs a bandstop filter.
[h,n] = freqz(B,A,t);
subplot(4,2,5),plot(n/pi,angle(h)*180/pi),title('Bandstop Butterworth Phase response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Phase(Degree)');
subplot(4,2,6),plot(n/pi,20*log(abs(h))),title('Bandstop Butterworth Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');

%For Bandpass
[N,wn] = buttord(pb,sb,a,b);
[B,A] = butter(N,wn,'bandpass'); %designs a bandpass filter.
[h,n] = freqz(B,A,t);
subplot(4,2,7),plot(n/pi,angle(h)*180/pi),title('Bandpass Butterworth Phase response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Phase(Degree)');
subplot(4,2,8),plot(n/pi,20*log(abs(h))),title('Bandpass Butterworth Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
