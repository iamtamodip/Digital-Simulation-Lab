n1=input('Input width of Input DTS (widtth should be in Integer)');
disp('Elements of Input (Press enter of each element)');
for i=1:n1
    x(1,i)=input('-->');
end
y=xcorr(x,x);
x1=0:1:n1-1;
y1=1-n1:1:n1-1;
subplot(2,2,1), stem(x1,x,'filled'),title('Input DTS'),xlabel('n'),ylabel('X(n)')
subplot(2,2,3), stem(y1,y,'filled'),title('Output DTS'),xlabel('n'),ylabel('y(n)')
disp('The Input sequence is');
disp(x);
disp('The Output sequence is');
disp(y);