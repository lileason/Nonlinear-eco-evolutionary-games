function dx=equsin(t,x,a,delta,epsilon,theta,rd,N,c) 
dx=zeros(2,1); 
if sin(a*t+delta)==0
    dx(1)=x(1)*(1-x(1))*c*(((1+(N-1)*x(1))/N*x(2)-1)-rd*(N-1)*x(1)/N);
    dx(2)=epsilon*(x(2)-1.5)*(3.5-x(2))*(-x(1)*c*((1+(N-1)*x(1))/N*x(2)-1)+theta*(1-x(1))*c*rd*(N-1)*x(1)/N);
else
    w = -0.5*sin(a*t+delta)+1;
    dx(1)=x(1)*(1-x(1))*c*((x(2) / N /(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)-rd / N /(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));
    dx(2)=epsilon*(x(2)-1.5)*(3.5-x(2))*(-x(1)*c*(x(2) / N /(1-w)*(1-w*(1-x(1)+w*x(1))^(N-1))-1)+theta*(1-x(1))*c*rd / N /(1-w)*(1-(1-x(1)+w*x(1))^(N-1)));
end
end