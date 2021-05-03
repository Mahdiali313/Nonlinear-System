% IN THE NAME OF ALLAH (GOD)
%  Written by Mahdi  2021
% this file find approximate of root of equation (moadele) with newton-raphson method
% this code run correctly on MATLAB R2020b
clear
clc
format long

disp("f(x) ra vard konid.masalan exp(-x)-cos(x)")
fxStr = input ('', 's');
fx = inline(fxStr,'x') ;%convert to equation , until matlab understand it

disp('baze moadele ro besorat [a b] vared konid.(a < b ).masalan [0 pi/2]')
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

% <derivatives>
syms x;
fX = str2sym(fxStr); %prepare to recognize fx for diff()
fPrim = diff(fX) ;% moshtagh f(x)
fprimex = inline(fPrim,'x') ;
% </derivatives>


% <x Array(table)>
x = [0];
x = [x ; 0]; %if you delete this line,all x write in one row
disp('meghdar avalie ro vard konid (X0). masalan 1')
x(1) = input ('');
i = 1;
% </x Array(table)>


fxi = feval(fx,x(1));
fprimexi = feval(fprimex,x(1));
x(2)=x(1) - (fxi/fprimexi);
i=2;

while abs( x(i)-x(i-1) ) >= stopCondition
    
    fxi = feval(fx,x(i));
    fprimexi = feval(fprimex,x(i));
    x(i+1)=x(i) - (fxi/fprimexi);
    i=i+1;
    
end

disp(' ')
answer = x(length(x));%last block of x arraye is our answer
disp([ 'answer ~= ', num2str(answer,'%.7f'),' with ',num2str(length(x)-1) ,' repeated' ])

for j = 1:length(x)
    disp([ 'X', num2str(j-1),'   ', num2str(x(j),'%.7f') ])
end
