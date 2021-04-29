% IN THE NAME OF ALLAH(GOD)
%  Written by Mahdi 2021
% this file find approximate of root of equation (moadele) with fixed-point method (noghte sabet)
% this code run correctly on MATLAB R2020b
clear
clc
format long 

disp("g(x) ra vard konid.masalan (1+x)^(1/3) ")
gxStr = input ('','s');
gx = inline(gxStr,'x') ;%convert to equation , until matlab understand it

disp('baze moadele ro besorat [a b] vared konid.(a < b ).masalan [1 2]')
baze = input ('');
a=baze(1);
b=baze(2);


%------------------------------------
%check for 2 enough condition for g(x)
fungIna = feval(gx,a);
fungInb = feval(gx,b);
condition1 = (fungIna <= b) & (fungIna >= a);

syms x
gx = str2sym(gxStr) ;%prepare to recognize gx for diff()
gPrime1 = diff(gx) ;% moshtagh g(x)
gPrime = inline(gPrime1,'x') ;
gPrimeIna = feval(gPrime,a);
gPrimeInb = feval(gPrime,b);
condition2 = abs(gPrimeIna) < 1 & abs(gPrimeInb) < 1;

if condition1 == 0 & condition2 == 0
    error('your g(x) isnt pass 2 enough condtion in fixed-point method');
end
disp([ 'g(a)= ',num2str(fungIna),' & g(b)= ',num2str(fungInb) ,' E [',num2str(a),' ',num2str(b),']' ]);
disp(' ')
disp([ '|g`(a)|= ',num2str(abs(gPrimeIna)),' & |g`(b)|= ',num2str(abs(gPrimeInb)),' < 1' ]);
disp('-- > |g`(x)| < 1');
disp(' ')
%------------------------------------

disp('megdar shart tavaghof( |Xn - Xn-1|< e )ro vard konid.masalan 0.5*10^-4')
stopCondition= input ('');

x = [0];
x = [x ; 0]; % i want to matlab write new x in colume , not in rows. if you delete this line,all x write in one row
disp('meghdar avalie ro vard konid (X0).masalan 1.2')
x(1) = input ('');
i=1;

gx = inline(gxStr,'x') ;

x(2) = feval( gx,x(1) ); 
i=2;


while abs( x(i)-x(i-1) ) >= stopCondition
    
    x(i+1) = feval( gx,x(i) );
    i=i+1;
end

answer = x(length(x));%last block of x arraye is our answer
disp([ 'answer ~= ', num2str(answer,'%.7f'),' with ',num2str(length(x)-1) ,' repeated' ])

for j = 1:length(x)
    disp([ 'X', num2str(j-1),'   ', num2str(x(j),'%.7f') ])
end
