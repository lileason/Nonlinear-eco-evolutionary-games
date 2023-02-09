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
x = theta/(theta+1);
r1 = (N*(w1-1)+rd*((w1*x-x+1)^(N-1)-1))/(w1*(w1*x-x+1)^(N-1)-1);
e1 = (r1*w1-rd)*(N-1)*(w1*theta+1)^(N-2)*(w1-1)/(r1-alpha)/(beta-r1)/(w1*(w1*theta+1)^(N-1)-(1+theta)^(N-1));
r2 = (theta*rd*(N-1)+N*(theta+1))/(theta*(N-1)+theta+1);
e2 = ((1-x)*(N-1)*(r2-rd))/(((N-1)*x+1)*(r2-alpha)*(beta-r2));
r3 = (N*(w3-1)+rd*((w3*x-x+1)^(N-1)-1))/(w3*(w3*x-x+1)^(N-1)-1);
e3 = (r3*w3-rd)*(N-1)*(w3*theta+1)^(N-2)*(w3-1)/(r3-alpha)/(beta-r3)/(w3*(w3*theta+1)^(N-1)-(1+theta)^(N-1));

h = 0.05;
tf = 500;%Ê±¼ä
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

% subplot(3,3,1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1-0.2,theta,rd,N,c);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick','');
set(gca,'YTick',1.5:0.5:3.5);
title('\epsilon<\epsilon^{*}');
hold off
% 
% subplot(3,3,2)
figure(1)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1,theta,rd,N,c);
        X=x(:,1);
        R=x(:,2);
        if X(end) > 1-exp(-6)
            arrowPlot(X,R,'number', 5,'color', 'k', 'LineWidth', 0.2, 'scale', 0.1);
        elseif X(end) < exp(-6)
            arrowPlot(X,R,'number', 5,'color', '[0.73725 0.82353 0.93333]', 'LineWidth', 0.2, 'scale', 0.1);
        else
            arrowPlot(X,R,'number', 5,'color', '[1 1 0]', 'LineWidth', 0.2, 'scale', 0.1);
        end
        hold on
    end
end
axis([0 1 1.5 3.5]);
set(gca,'XTick','');
set(gca,'YTick','');
title('\epsilon=\epsilon^{*}');
hold off

% subplot(3,3,3)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1+0.5,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick','');
% set(gca,'YTick','');
% title('\epsilon>\epsilon^{*}');
% hold off
% 
% subplot(3,3,4)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2-0.2,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick','');
% set(gca,'YTick',1.5:0.5:3.5);
% ylabel('multiplication of cooperators,r_{c}');
% hold off
% 
% subplot(3,3,5)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick','');
% set(gca,'YTick','');
% hold off
% 
% subplot(3,3,6)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2+0.5,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick','');
% set(gca,'YTick','');
% hold off
% 
% 
% subplot(3,3,7)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3-0.2,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% 
% hold off
% 
% subplot(3,3,8)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick','');
% xlabel('ratio of cooperators,x^{*}');
% hold off
% 
% subplot(3,3,9)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3+0.5,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'y', 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', 'b', 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', 'g', 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick','');
% 
% hold off

