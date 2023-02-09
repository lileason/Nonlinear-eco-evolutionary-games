clc,clear

theta = 1.2;
rd = 0.7;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
w1 = 0.8;
w3 = 1.2;
x0 = theta/(theta+1);
a = 0.4;


r1 = (N*(w1-1)+rd*((w1*x0-x0+1)^(N-1)-1))/(w1*(w1*x0-x0+1)^(N-1)-1);
e1 = (r1*w1-rd)*(N-1)*(w1*theta+1)^(N-2)*(w1-1)/(r1-alpha)/(beta-r1)/(w1*(w1*theta+1)^(N-1)-(1+theta)^(N-1));
r3 = (N*(w3-1)+rd*((w3*x0-x0+1)^(N-1)-1))/(w3*(w3*x0-x0+1)^(N-1)-1);
e3 = (r3*w3-rd)*(N-1)*(w3*theta+1)^(N-2)*(w3-1)/(r3-alpha)/(beta-r3)/(w3*(w3*theta+1)^(N-1)-(1+theta)^(N-1));

% e11 = e1/2;
% e22 = (e1+e3)/2;
% e33 = e3+0.5;

e11 = 0.5;
e22 = 2;
e33 = 5;

h = 0.05;
tf = 500;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equfd,[0,tf],[x_0;r_0],options,e11,theta,rd,N,c,a);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
%title('\epsilon = 0.2');
box on
hold off

figure(2)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equfd,[0,tf],[x_0;r_0],options,e22,theta,rd,N,c,a);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off

figure(3)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equfd,[0,tf],[x_0;r_0],options,e33,theta,rd,N,c,a);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick',0:0.2:1);
set(gca,'YTick',1.5:0.4:3.5);
xlabel('frequency of cooperators,x');
ylabel('multiplication of cooperators,r_{c}');
box on
hold off