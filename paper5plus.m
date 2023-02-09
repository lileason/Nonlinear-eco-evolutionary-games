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

h = 0.08;
tf = 2000;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);

a = 0.01;

% figure(1)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,e11,theta,rd,N,c);
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
% title('a = 1');
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
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,e22,theta,rd,N,c);
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
% title('w=sin(at+\delta)');
% box on
% hold off

% figure(3)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [~,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,e33,theta,rd,N,c);
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

% %时序图
% figure(4)
% interval=400;
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode23(@equsin,[0,tf],[x_0;r_0],options,a,delta,e33,theta,rd,N,c);
%         T=t(1:(10*tf+1),1);
%         X=x(1:(10*tf+1),1);
%         R=x(1:(10*tf+1),2); 
%         plot(T,X,'-','Color',[1 0.41176 0.70588],'LineWidth',1);
%         hold on
%     end
% end
% 
% set(gca,'XTick',0:(tf/5):tf);
% set(gca,'YTick',0:0.2:1);
% 
% title('a = 0.2');
% box on
% hold off


%w=1不变
% figure(5)
% hold on;
% box on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,1.5,e11,theta,rd,N,c);
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
% set(gca,'XTick','');
% set(gca,'YTick','');
% hold off
% 
% 
% %w变化sin
% figure(6)
% T = 0:0.01:tf;
% W = zeros(tf/0.01+1,1);
% for i =1:(tf/0.01+1)
%     if sin(a*T(i)+delta)==0
%         W(i) = 1;
%     elseif sin(a*T(i)+delta)<0
%         W(i) = (1-0.5*sin(a*T(i)+delta));
%     else
%         W(i) = 1/(1+sin(a*T(i)+delta));
%     end
% end
% plot(T,W);



figure(7)
[~,x]=ode23(@equsin,[0,tf],[0.2;2.3],options,a,delta,e33,theta,rd,N,c);
X=x(:,1);
R=x(:,2);
arrowPlot(X,R,'number', 5,'color', [1 0.41176 0.70588], 'LineWidth', 0.2, 'scale', 0.1);
hold on

[~,x]=ode23(@equsin,[0,tf],[0.4;3.2],options,a,delta,e33,theta,rd,N,c);
X=x(:,1);
R=x(:,2);
arrowPlot(X,R,'number', 5,'color', [0.2549 0.41176 0.8235], 'LineWidth', 0.2, 'scale', 0.1);
hold on

[~,x]=ode23(@equsin,[0,tf],[0.3;1.9],options,a,delta,e33,theta,rd,N,c);
X=x(:,1);
R=x(:,2);
arrowPlot(X,R,'number', 5,'color', [0.95686 0.64314 0.37647], 'LineWidth', 0.2, 'scale', 0.1);
hold off


% figure(8)
% [t,x]=ode23(@equsin,[0,tf],[0.2;2.3],options,a,delta,e33,theta,rd,N,c);
% T=t(1:(10*tf+1),1);
% X=x(1:(10*tf+1),1);
% R=x(1:(10*tf+1),2);
% plot(T,X,'-','Color',[1 0.41176 0.70588],'LineWidth',1);
% hold on
% [t,x]=ode23(@equsin,[0,tf],[0.4;3.2],options,a,delta,e33,theta,rd,N,c);
% T=t(1:(10*tf+1),1);
% X=x(1:(10*tf+1),1);
% R=x(1:(10*tf+1),2);
% plot(T,X,'-','Color',[0.2549 0.41176 0.8235],'LineWidth',1);
% hold on
% [t,x]=ode23(@equsin,[0,tf],[0.3;1.9],options,a,delta,e33,theta,rd,N,c);
% T=t(1:(10*tf+1),1);
% X=x(1:(10*tf+1),1);
% R=x(1:(10*tf+1),2);
% plot(T,X,'-','Color',[0.95686 0.64314 0.37647],'LineWidth',1);
% hold on