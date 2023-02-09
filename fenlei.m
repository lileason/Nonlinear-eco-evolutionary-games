clc,clear

theta = 2;
rd = 1;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
w1 = 0.8;
w2 = 1;
w3 = 1.2;
x0 = theta/(theta+1);
r1 = (N*(w1-1)+rd*((w1*x0-x0+1)^(N-1)-1))/(w1*(w1*x0-x0+1)^(N-1)-1);
e1 = (r1*w1-rd)*(N-1)*(w1*theta+1)^(N-2)*(w1-1)/(r1-alpha)/(beta-r1)/(w1*(w1*theta+1)^(N-1)-(1+theta)^(N-1));
r2 = (theta*rd*(N-1)+N*(theta+1))/(theta*(N-1)+theta+1);
e2 = ((1-x0)*(N-1)*(r2-rd))/(((N-1)*x0+1)*(r2-alpha)*(beta-r2));
r3 = (N*(w3-1)+rd*((w3*x0-x0+1)^(N-1)-1))/(w3*(w3*x0-x0+1)^(N-1)-1);
e3 = (r3*w3-rd)*(N-1)*(w3*theta+1)^(N-2)*(w3-1)/(r3-alpha)/(beta-r3)/(w3*(w3*theta+1)^(N-1)-(1+theta)^(N-1));

h = 0.04;
tf = 400;%Ê±¼ä
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

X1 = [];X2 = [];X3 = [];
R1 = [];R2 = [];R3 = [];

hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3,theta,rd,N,c);
        if x(end,1) > 1-exp(-6)
            X1 = [X1 x(:,1)];
            R1 = [R1 x(:,2)];
        elseif x(end,1) < exp(-6)
            X2 = [X2 x(:,1)];
            R2 = [R2 x(:,2)];
        else
            X3 = [X3 x(:,1)];
            R3 = [R3 x(:,2)];
        end
        hold on
    end
end
arrowPlot(X1,R1,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
hold on
arrowPlot(X2,R2,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
hold on
arrowPlot(X3,R3,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);

axis([0 1 1.5 3.5]);
set(gca,'XTick','');
set(gca,'YTick','');
title('\epsilon=\epsilon^{*}');
hold off