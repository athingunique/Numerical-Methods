% y = 1 / mx + b
% 1/y = mx+b
% Y = 1/y, X = x, ai = m, ao = b
% Y = ai*X + ao
x = [-2.0,3.5,9.0,14.5,20.0];
y = [0.182,0.059,0.033,0.024,0.019];
Y = 1./y;
p = polyfit(Y,x,1);
hold on

plot(x,y,'*')
fx = linspace(min(x),max(x));
fy = (p(1).*fx + p(2));
Fy = 1./fy;
plot(fx,Fy)