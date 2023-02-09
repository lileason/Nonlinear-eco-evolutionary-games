function dx=equfd1(t,x,epsilon,theta,rd,N,c,a) 
dx=zeros(2,1); 
if mod(floor(t/pi*a*4/2),4) == 0
    w = 1.4;
elseif mod(floor(t/pi*a*4/2),4) == 2
    w = 0.6;
else
    w = 1;
end
if w == 1
    dx(1)=x(1)*(1-x(1))*c*(((1+(N-1)*x(1))/N*x(2)-1)-rd*(N-1)*x(1)/N);
    dx(2)=epsilon*(x(2)-1.5)*(3.5-x(2))*(-x(1)*c*((1+(N-1)*x(1))/N*x(2)-1)+theta*(1-x(1))*c*rd*(N-1)*x(1)/N);
else
    dx(1)=x(1)*(1-x(1))*c*((x(2)/N/(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)-rd/N/(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));
    dx(2)=epsilon*(x(2)-1.5)*(3.5-x(2))*(-x(1)*c*(x(2)/N/(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)+theta*(1-x(1))*c*rd/N/(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));
end
end