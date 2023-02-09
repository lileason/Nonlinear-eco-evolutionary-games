clear
theta = 1;
rd = 1.2;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
x0 = theta/(theta+1);
a = 0.1;
delta = 0;
epsilon = 4;
tend = 160;
w1 = 1.2;
w2 = 0.8;
w3 = 1.5;
w4 = 0.5;
ww = 0.5:0.01:1.5;


h = 0.05;
tf = 500;%时间
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);
final = floor(1/h)-1;
interval = 400;

xx = theta./(theta+1);
rr1 = (N.*(w1-1)+rd.*((w1.*xx-xx+1).^(N-1)-1))./(w1.*(w1.*xx-xx+1).^(N-1)-1);
rr2 = (N.*(w2-1)+rd.*((w2.*xx-xx+1).^(N-1)-1))./(w2.*(w2.*xx-xx+1).^(N-1)-1);
rr3 = (N.*(w3-1)+rd.*((w3.*xx-xx+1).^(N-1)-1))./(w3.*(w3.*xx-xx+1).^(N-1)-1);
rr4 = (N.*(w4-1)+rd.*((w4.*xx-xx+1).^(N-1)-1))./(w4.*(w4.*xx-xx+1).^(N-1)-1);
rr = (N.*(ww-1)+rd.*((ww.*xx-xx+1).^(N-1)-1))./(ww.*(ww.*xx-xx+1).^(N-1)-1);
e = (rr.*ww-rd).*(N-1).*(ww.*theta+1).^(N-2).*(ww-1)./(rr-alpha)./(beta-rr)./(ww.*(ww.*theta+1).^(N-1)-(1+theta).^(N-1));
e1 = max(e);
e2 = min(e);
x1 = 0.1;r1 = 1.9;
x2 = 0.2;r2 = 2.7;
x3 = 0.6;r3 = 2.3;
x4 = 0.8;r4 = 3.1;

%
% 离散
% figure(1)
% hold on;
% for i = 1:final
%     for j = 1:final
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x] = ode45(@equfd,[0,tend],[x_0;r_0],options,epsilon,theta,rd,N,c,a);
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
% 
% [~,x]=ode45(@equfd,[0,tf],[x1;r1],options,epsilon,theta,rd,N,c,a);
% X1 = x(1:(40*tf+1),1);
% R1 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equfd,[0,tf],[x2;r2],options,epsilon,theta,rd,N,c,a);
% X2 = x(1:(40*tf+1),1);
% R2 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equfd,[0,tf],[x3;r3],options,epsilon,theta,rd,N,c,a);
% X3 = x(1:(40*tf+1),1);
% R3 = x(1:(40*tf+1),2);
% [t,x]=ode45(@equfd,[0,tf],[x4;r4],options,epsilon,theta,rd,N,c,a);
% T = t(1:(40*tf+1),1);
% X4 = x(1:(40*tf+1),1);
% R4 = x(1:(40*tf+1),2);
% 
% figure(3)
% hold on
% plot(T,X1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,X2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,X3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,X4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% 
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',0:0.2:1);
% axis([0 tend 0 1]);
% xlabel('t');
% ylabel('frequency of cooperators,x');
% legend('x_0=0.1,r_{c_{0}}=1.9',...
%     'x_0=0.2,r_{c_{0}}=2.7',...
%     'x_0=0.6,r_{c_{0}}=2.3',...
%     'x_0=0.8,r_{c_{0}}=3.1');
% box on
% hold off
% 
% figure(4)
% hold on
% plot(T,R1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,R2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,R3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% plot(T,R4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(T),'MarkerSize',8);
% 
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',1.5:0.4:3.5);
% axis([0 tend 1.5 3.5]);
% xlabel('t');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off



%%
%连续

% figure(5)
% hold on;
% for i = 1:floor(1/h)-1
%     for j = 1:floor(1/h)-1
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equst,[0,tend],[x_0;r_0],options,a,delta,epsilon,theta,rd,N,c);
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


% [~,x]=ode45(@equst,[0,tf],[x1;r1],options,a,delta,epsilon,theta,rd,N,c);
% XX1 = x(1:(40*tf+1),1);
% RR1 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equst,[0,tf],[x2;r2],options,a,delta,epsilon,theta,rd,N,c);
% XX2 = x(1:(40*tf+1),1);
% RR2 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equst,[0,tf],[x3;r3],options,a,delta,epsilon,theta,rd,N,c);
% XX3 = x(1:(40*tf+1),1);
% RR3 = x(1:(40*tf+1),2);
% 
% [~,x]=ode45(@equst,[0,tf],[0.5;2.5],options,a,delta,epsilon,theta,rd,N,c);
% XX5 = x(1:(40*tf+1),1);
% RR5 = x(1:(40*tf+1),2);
% 
% 
% [t,x]=ode45(@equst,[0,tf],[x4;r4],options,a,delta,epsilon,theta,rd,N,c);
% TT = t(1:(40*tf+1),1);
% XX4 = x(1:(40*tf+1),1);
% RR4 = x(1:(40*tf+1),2);



% figure(7)
% hold on
% plot(TT,XX1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,XX2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,XX3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,XX4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,XX5,'-','LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% % plot(TT,XX6,'-','LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% 
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',0:0.2:1);
% axis([0 tend 0 1]);
% xlabel('t');
% ylabel('frequency of cooperators,x');
% legend('x_0=0.1,r_{c_{0}}=1.9',...
%     'x_0=0.2,r_{c_{0}}=2.7',...
%     'x_0=0.6,r_{c_{0}}=2.3',...
%     'x_0=0.8,r_{c_{0}}=3.1');
% box on
% hold off
% 
% figure(8)
% hold on
% plot(TT,RR1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,RR2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,RR3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,RR4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% plot(TT,RR5,'-','LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% % plot(TT,RR6,'-','LineWidth',1,'MarkerIndices',1:interval:length(TT),'MarkerSize',8);
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',1.5:0.4:3.5);
% axis([0 tend 1.5 3.5]);
% xlabel('t');
% 
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off

% figure(2)
% hold on
% plot(xx,rr1,'b^','LineWidth', 1);
% hold on
% plot(xx,rr2,'r^','LineWidth', 1);%两个平衡点
% hold on
% arrowPlot(X1,R1,'number', 10,'color', [0.2549 0.41176 0.8235], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(X2,R2,'number', 10,'color', [0.95686 0.64314 0.37647], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(X3,R3,'number', 10,'color', [1 0.41176 0.70588], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(X4,R4,'number', 10,'color', [0.18039 0.70196 0.44314], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% legend('fixed point 1','fixed point 2');
% box on
% hold off



% figure(6)
% hold on
% plot(XX3(5027),RR3(5027),'k^','LineWidth', 1);
% hold on
% plot(XX3(5655),RR3(5655),'k^','LineWidth', 1);
% hold on
% plot(XX3(6283),RR3(6283),'k^','LineWidth', 1);
% hold on
% plot(XX3(6912),RR3(6912),'k^','LineWidth', 1);
% 
% hold on
% arrowPlot(XX1,RR1,'number', 10,'color', [0.2549 0.41176 0.8235], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XX2,RR2,'number', 10,'color', [0.95686 0.64314 0.37647], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XX3,RR3,'number', 10,'color', [1 0.41176 0.70588], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XX4,RR4,'number', 10,'color', [0.18039 0.70196 0.44314], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off



%% 四段
% figure(9)
% hold on;
% for i = 1:final
%     for j = 1:final
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x] = ode45(@equfd1,[0,tend],[x_0;r_0],options,epsilon,theta,rd,N,c,a);
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

% %10-12数据
% [~,x]=ode45(@equfd1,[0,tf],[x1;r1],options,epsilon,theta,rd,N,c,a);
% XXX1 = x(1:(40*tf+1),1);
% RRR1 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equfd1,[0,tf],[x2;r2],options,epsilon,theta,rd,N,c,a);
% XXX2 = x(1:(40*tf+1),1);
% RRR2 = x(1:(40*tf+1),2);
% [~,x]=ode45(@equfd1,[0,tf],[x3;r3],options,epsilon,theta,rd,N,c,a);
% XXX3 = x(1:(40*tf+1),1);
% RRR3 = x(1:(40*tf+1),2);
% [t,x]=ode45(@equfd1,[0,tf],[x4;r4],options,epsilon,theta,rd,N,c,a);
% TTT = t(1:(40*tf+1),1);
% XXX4 = x(1:(40*tf+1),1);
% RRR4 = x(1:(40*tf+1),2);
% % 
% 
figure(10)
w5 = 1.4;
w6 = 0.6;
w7 = 1;
rr5 = (N.*(w5-1)+rd.*((w5.*xx-xx+1).^(N-1)-1))./(w5.*(w5.*xx-xx+1).^(N-1)-1);
rr6 = (N.*(w6-1)+rd.*((w6.*xx-xx+1).^(N-1)-1))./(w6.*(w6.*xx-xx+1).^(N-1)-1);
rr7 = (theta*rd*(N-1)+N*(theta+1))/(theta*(N-1)+theta+1);
hold on
plot(xx,rr5,'b^','LineWidth', 1);
hold on
plot(xx,rr7,'g^','LineWidth', 1);
hold on
plot(xx,rr6,'r^','LineWidth', 1);%3个平衡点
hold on
% arrowPlot(XXX1,RRR1,'number', 10,'color', [0.2549 0.41176 0.8235], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XXX2,RRR2,'number', 10,'color', [0.95686 0.64314 0.37647], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XXX3,RRR3,'number', 10,'color', [1 0.41176 0.70588], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% hold on
% arrowPlot(XXX4,RRR4,'number', 10,'color', [0.18039 0.70196 0.44314], ...
%     'LineWidth', 0.8, 'scale', 0.2);
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.2:1);
% set(gca,'YTick',1.5:0.4:3.5);
% xlabel('frequency of cooperators,x');
% ylabel('multiplication of cooperators,r_{c}');
% legend('fixed point 1','fixed point 2','fixed point 2');
% box on
% hold off


% figure(11)
% hold on
% plot(TTT,XXX1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,XXX2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,XXX3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,XXX4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% 
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',0:0.2:1);
% axis([0 tend 0 1]);
% xlabel('t');
% ylabel('frequency of cooperators,x');
% legend('x_0=0.1,r_{c_{0}}=1.9',...
%     'x_0=0.2,r_{c_{0}}=2.7',...
%     'x_0=0.6,r_{c_{0}}=2.3',...
%     'x_0=0.8,r_{c_{0}}=3.1');
% box on
% hold off
% 
% figure(12)
% hold on
% plot(TTT,RRR1,'-x','Color',[0.2549 0.41176 0.8235],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,RRR2,'-*','Color',[0.95686 0.64314 0.37647],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,RRR3,'-o','Color',[1 0.41176 0.70588],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% plot(TTT,RRR4,'-d','Color',[0.18039 0.70196 0.44314],'LineWidth',1,'MarkerIndices',1:interval:length(TTT),'MarkerSize',8);
% set(gca,'XTick',0:floor(tend/4):tend);
% set(gca,'YTick',1.5:0.4:3.5);
% axis([0 tend 1.5 3.5]);
% xlabel('t');
% ylabel('multiplication of cooperators,r_{c}');
% box on
% hold off



