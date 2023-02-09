%% paperB8

clc,clear

theta = 0.5;
rd = 0.6;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
x0 = theta/(theta+1);
epsilon = 7;

d1 = -pi/2;
d2 = 0;
d3 = pi/2;

h = 0.05;
tf = 400;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

%% a=0.1
a1 = 0.1;

figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a1,d1,epsilon,theta,rd,N,c);
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

figure(2)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a1,d2,epsilon,theta,rd,N,c);
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
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a1,d3,epsilon,theta,rd,N,c);
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


%% a = 1;
a2 = 1;

figure(4)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a2,d1,epsilon,theta,rd,N,c);
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

figure(5)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a2,d2,epsilon,theta,rd,N,c);
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

figure(6)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equsin,[0,tf],[x_0;r_0],options,a2,d3,epsilon,theta,rd,N,c);
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
