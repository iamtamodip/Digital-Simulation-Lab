f=input('Input fundamental frequency of the sinusoid (in Hz)');
A1=input('Input amplitude of  fundamental of the sinusoid (in p.u.)');
A2=input('Amplitude of the third harmonic of the sinusoid (in p.u.)');
A3=input('Amplitude of the fifth harmonic of the sinusoid (in p.u.)');
A4=input('Amplitude of the seventh harmonic of the sinusoid (in p.u.)');
fs=input('Input sampling rate (in Hz)');
L=input('Input length of DFT');
n=0:L-1;
y1=A1*sin(2*pi*(f/fs)*n);
y2=A2*sin(6*pi*(f/fs)*n);
y3=A3*sin(10*pi*(f/fs)*n);
y4=A4*sin(14*pi*(f/fs)*n);
y=y1+y2+y3+y4;
z=fft(y,256);
v=abs(z);
subplot(2,1,1),stem(n,y),title('Impure sinusoidal sequence'),xlabel('n'),ylabel('x(n)');
subplot(2,1,2),stem(n,v),title('Magnitudes of the DFT coefficients'),xlabel('f(Hz)'),ylabel('|X(jw)|');
for i=1:256
    if round(v(i),2)>0
        disp('Co efficient of DFT for frequency');
        disp(i-1);
        disp('is');
        disp(v(i));
    end
    
end
