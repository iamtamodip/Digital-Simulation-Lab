f=input('Input fundamental frequency of Sin wave (in Hz)');
A=input('Input amplitude of sin wave');
fs=input('Input sampling rate (in Hz)');
L=input('Input length of DFT');
n=0:L-1;
y=A*sin(2*pi*(f/fs)*n);
z=fft(y,256);
v=abs(z);
subplot(2,1,1),stem(n,y),title('Pure sinusoidal sequence'),xlabel('n'),ylabel('x(n)');
subplot(2,1,2),stem(n,v),title('Magnitudes of the DFT coefficients'),xlabel('f(Hz)'),ylabel('|X(jw)|');
for i=1:256
    if round(v(i),2)>0
        disp('Co efficient of DFT for frequency')
        disp(i-1)
        disp('is')
        disp(v(i))
    end
    
end
