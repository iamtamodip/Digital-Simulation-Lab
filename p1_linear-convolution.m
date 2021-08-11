n1=input('Input width of Input DTS (widtth should be in Integer)');
disp('Elements of Input (Press enter of each element)');
for i=1:n1
    x(1,i)=input('-->');
end
n2=input('Input width of Impulse Responce DTS (widtth should be in Integer)');
disp('Elements of  Impulse Responce(Press enter of each element)');
for i=1:n2
    h(1,i)=input('-->');
end
y=conv(x,h);
x1=0:1:n1-1;
h1=0:1:n2-1;
y1=0:1:(n1+n2-2);
subplot(2,2,1), stem(x1,x,'filled'),title('Input DTS'),xlabel('n'),ylabel('X(n)');
subplot(2,2,2), stem(h1,h,'filled'),title('Impulse Responce DTS'),xlabel('n'),ylabel('h(n)');
subplot(2,2,3), stem(y1,y,'filled'),title('Output DTS'),xlabel('n'),ylabel('y(n)');
disp('The Input sequence is');
disp(x);
disp('The Impulse responce sequence is');
disp(h);
disp('The Output sequence is');
disp(y);