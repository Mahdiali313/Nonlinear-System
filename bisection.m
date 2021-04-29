% IN THE NAME OF ALLAH(GOD)
%  Written by Mahdi 2021
% this file find approximate of root of equation (moadele) with bisection method (tansif)
% this code run correctly on MATLAB R2020b
clear
clc

disp('baze moadele ro besorat [a b] vared konid.(a < b ).masalan [1 2] :')
baze = input ('');

a=baze(1);
b=baze(2);

disp('megdar khata ravesh (epselon) ro vard konid.masalan 10^-4 :')
epselon= input ('');

disp("f(x) ra vard konid.masalan x^2-4*sin(x)" )
f = input ( "", 's');
f = inline(f,'x') ;%convert to equation , until matlab understand it

format long

%make table to store data
table=[0 0 0 0 0] % i  a  b  m  |b-a|

m= (a+b)/2 ;
func = feval(f,m);
condition = abs(func) > epselon | b-a > epselon
i=0

while  abs( feval(f,(a+b)/2)) >= epselon | b-a >= epselon
    i = i +1
    m= (a+b)/2 

               % i a b m  |b-a|
    table=[table;i a b m abs(b-a) ]
    
    funcA = feval(f,a)
    funcM = feval(f,m)

    resualt= funcA*funcM
    
    if resualt == 0 
        a=m
        disp('a=m'+num2str(a))
        break ;
        
    elseif resualt < 0 
        b=m
    elseif resualt > 0 
        a=m
    end
    
end

clc
disp([ 'answer ~= ', num2str(m,'%.7f'),' with ',num2str(length(table)-1) ,' repeated' ])

disp('	 i    	 a    	 b     	 m       |b-a|')
table
