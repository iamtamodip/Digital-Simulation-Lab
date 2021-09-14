a = input('Enter Passband ripple_');
b = input('Enter Stopband ripple_');
c = input('Enter Passband edge frequency (in Hz)_');
d = input('Enter Stopband edge frequency (in Hz)_');
e = input('Enter Sampling frequency (in Hz)');

n = (-20*log10(sqrt(a)*sqrt(b))-13)/(14.6*(d-c)/e); %Calculating order of the Filter
n=ceil(n);    %Round towards plus infinity
wp = 2*c/e;   %Normalized Frequency = Normal Frequency * pi / Sampling Frequency
ws = 2*d/e;
ps = [wp ws]; %Taking Passband frequency

rl = fir1(n,ws,'low',rectwin(n+1));
rp = fir1(n,ps,'bandpass',rectwin(n+1));

bl = fir1(n,ws,'low',blackman(n+1));
bp = fir1(n,ps,'bandpass',blackman(n+1));

hml = fir1(n,ws,'low',hamming(n+1));
hmp = fir1(n,ps,'bandpass',hamming(n+1));

hnl = fir1(n,ws,'low',hann(n+1));
hnp = fir1(n,ps,'bandpass',hann(n+1));
if rem(n,2)==0
    
    rh = fir1(n,wp,'high',rectwin(n+1));
    rs = fir1(n,ps,'stop',rectwin(n+1)); 
    
    bh = fir1(n,wp,'high',blackman(n+1));
    bs = fir1(n,ps,'stop',blackman(n+1));
    
    hmh = fir1(n,wp,'high',hamming(n+1));
    hms = fir1(n,ps,'stop',hamming(n+1));
    
    hnh = fir1(n,wp,'high',hann(n+1));
    hns = fir1(n,ps,'stop',hann(n+1));
else
    rh = fir1(n,wp,'high',rectwin(n+2));
    rs = fir1(n,ps,'stop',rectwin(n+2));
    
    bh = fir1(n,wp,'high',blackman(n+2));
    bs = fir1(n,ps,'stop',blackman(n+2));
    
    hmh = fir1(n,wp,'high',hamming(n+2));
    hms = fir1(n,ps,'stop',hamming(n+2));
    
    hnh = fir1(n,wp,'high',hann(n+2));
    hns = fir1(n,ps,'stop',hann(n+2));
end

%Frequency responce os Lowpas, Highpass, Bandpass & Bandstop Filter with Rectangular window respectively
[Rl,Wl] = freqz(rl,n);
[Rh,Wh] = freqz(rh,n);
[Rp,Wp] = freqz(rp,n);
[Rs,Ws] = freqz(rs,n);

%Frequency responce os Lowpas, Highpass, Bandpass & Bandstop Filter with Blackman window respectively
[Bl,Wh] = freqz(bl,n);
[Bh,Wh] = freqz(bh,n);
[Bp,Wp] = freqz(bp,n);
[Bs,Ws] = freqz(bs,n);

%Frequency responce os Lowpas, Highpass, Bandpass & Bandstop Filter with Hamming window respectively
[Hml,Wl] = freqz(hml,n);
[Hmh,Wh] = freqz(hmh,n);
[Hmp,Wp] = freqz(hmp,n);
[Hms,Ws] = freqz(hms,n);

%Frequency responce os Lowpass, Highpass, Bandpass & Bandstop Filter with Hanning window respectively
[Hnl,Wl] = freqz(hnl,n);
[Hnh,Wh] = freqz(hnh,n);
[Hnp,Wp] = freqz(hnp,n);
[Hns,Ws] = freqz(hns,n);

%Magnitude (dB) plotting for Lowpass Filter
subplot(2,2,1),plot(Wl/pi,20*log(abs(Rl)),Wl/pi,20*log(abs(Bl)),Wl/pi,20*log(abs(Hml)),Wl/pi,20*log(abs(Hnl))),
title('Low pass Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
legend('Rectangular','Blackman','Hamming','Hanning','Location','southwest');

%Magnitude (dB) plotting for Highpass Filter
subplot(2,2,2),plot(Wh/pi,20*log(abs(Rh)),Wh/pi,20*log(abs(Bh)),Wh/pi,20*log(abs(Hmh)),Wl/pi,20*log(abs(Hnh))),
title('High pass Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
legend('Rectangular','Blackman','Hamming','Hanning','Location','southeast');

%Magnitude (dB) plotting for Bandpass Filter
subplot(2,2,3),plot(Wp/pi,20*log(abs(Rp)),Wp/pi,20*log(abs(Bp)),Wp/pi,20*log(abs(Hmp)),Wp/pi,20*log(abs(Hnp))),
title('Bandpass Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
legend('Rectangular','Blackman','Hamming','Hanning','Location','southwest');

%Magnitude (dB) plotting for Bandstop Filter
subplot(2,2,4),plot(Ws/pi,20*log(abs(Rs)),Ws/pi,20*log(abs(Bs)),Ws/pi,20*log(abs(Hms)),Ws/pi,20*log(abs(Hns))),
title('Bandstop Magnitude response'),xlabel('Normalized Frequency (\times\pi rad/sample)'),ylabel('Magnitude (dB)');
legend('Rectangular','Blackman','Hamming','Hanning','Location','southwest');
