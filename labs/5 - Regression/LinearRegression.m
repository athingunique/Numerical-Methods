% Evan Baker
% EAB_LAB05_P01
% 14 February 2014

% This script will do a linear regression of some data
function LinearRegression
	xy =[0.17, 0.63; 0.19, 0.7; 0.22, 0.82; 0.235, 0.88; 0.235, 1.15; 0.3, 1.5; 0.35, 4.4; 0.42, 7.3; 0.85, 11.3];
	x = xy(:,1);
	y = xy(:,2);
	p = polyfit(x,y,1);
	Rsquared = 1 - ( sum((y-(polyval(p,x))).^2) / sum((y-mean(y)).^2) );
	fx = [min(x) max(x)];
	fy = polyval(p,fx);
	plot(x,y,'o',fx,fy);xlabel('X Values');ylabel('Y Values');
	text(min(fx),max(fy),sprintf('y = %.3f x + %.3f, R^2 = %.3f',p(1),p(2),Rsquared))
end