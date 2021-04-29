% IN THE NAME OF ALLAH (GOD)
%  Written by Mahdi 2021
% this file find approximate of root of equation (moadele) with vatari method
% this code run correctly on MATLAB R2020b
clear
clc
format long

disp("f(x) ra vard konid.masalan cos(2*x)-x")
fxStr = input ('', 's');
fx = inline(fxStr,'x') ;%convert to equation , until matlab understand it

disp('baze moadele ro besorat [a b] vared konid.(a < b ).masalan [0 pi/4]')
baze = input ('');
a=baze(1);
b=baze(2);

disp('megdar shart tavaghof ( |Xn - Xn-1|< e ) ro vard konid.masalan 0.5*10^-4')
stopCondition= input ('');


%check function has at least a root in this baze (according ghazie miani)
fxa = feval(fx,a);
fxb = feval(fx,b);
if fxa * fxb > 0 
    error ('your f(x) isnt at least a root in this baze')
end
disp([ 'fx(a):',num2str(fxa),' & fx(b):',num2str(fxb) ])
disp('fx(a) * fx(b) < 0')


% <x Array(table)>
x = [0];
x = [x ; 0]; %if you delete this line,all x write in one row
disp('meghdar avalie ro vard konid [X0 X1]. masalan [0 0.5]')
avalie = input ('');
x(1) = avalie (1);
x(2) = avalie (2);
i = 2;
% </x Array(table)>


fxnback = feval(fx,x(1));
fxn = feval(fx,x(2));
x(3)= x(2)- ( (x(2)-x(1)) / (fxn-fxnback) ) *fxn;
i=3;


while abs( x(i)-x(i-1) ) >= stopCondition
    
    fxnback = feval(fx,x(i-1));
    fxn = feval(fx,x(i));
    x(i+1)= x(i)- ( (x(i)-x(i-1)) / (fxn-fxnback) ) *fxn;
    i=i+1;
    
end

disp(' ')
answer = x(length(x));%last block of x arraye is our answer
disp([ 'answer ~= ', num2str(answer,'%.7f'),' with ',num2str(length(x)-1) ,' repeated' ])

for j = 1:length(x)
    disp([ 'X', num2str(j-1),'   ', num2str(x(j),'%.7f') ])
end
 


