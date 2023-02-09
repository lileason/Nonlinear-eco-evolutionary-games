clc,clear

theta = 0.5;
rd = 0.6;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
x0 = theta/(theta+1);
delta = -pi/2;

w = 0.5:0.001:1.5;

r = (N.*(w-1)+rd.*((w.*x0-x0+1).^(N-1)-1))./(w.*(w.*x0-x0+1).^(N-1)-1);
e = (r.*w-rd).*(N-1).*(w.*theta+1).^(N-2).*(w-1)./(r-alpha)./(beta-r)./(w.*(w.*theta+1).^(N-1)-(1+theta).^(N-1));

e1 = max(e);
e2 = min(e);

e11 = 1;
e22 = 3;
e33 = 6;

h = 0.05;
tf = 400;%Ê±¼ä
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

%%
a1 = 0.01;
% figure(1)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a1,delta,e11,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off
% % 
% figure(2)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a1,delta,e22,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off

% figure(3)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [~,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a1,delta,e33,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off



% %%
a2 = 0.1;
% figure(4)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a2,delta,e11,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% 
% box on
% hold off
% 
% figure(5)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a2,delta,e22,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% ylabel('multiplication of cooperators,r_{c}');
% xlabel('frequency of cooperators,x');
% box on
% hold off
% 
% figure(6)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a2,delta,e33,theta,rd,N,c);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
%         elseif X(end) < exp(-6)
%             arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
%         else
%             arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
%         end
%         hold on
%     end
% end
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% ylabel('multiplication of cooperators,r_{c}');
% xlabel('frequency of cooperators,x');
% box on
% hold off

%%

a3 = 1;
figure(7)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a3,delta,e11,theta,rd,N,c);
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
% 
figure(8)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a3,delta,e22,theta,rd,N,c);
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

figure(9)
hold on;
box on;
for i = 1:floor(1/h)-1
    for j = 1:floor(1/h)-1
        x_0 = h*i;
        r_0 = 1.5+2*h*j;
        [~,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a3,delta,e33,theta,rd,N,c);
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

