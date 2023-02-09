clc
clear


w1 = 0.8;
w2 = 1.2;

rd1 = 0.1;
rd2 = 0.8;
rd3 = 1.2;

N = 4;
theta = 0.5:0.001:10;
alpha = 1.5;
beta = 3.5;

x = theta./(theta+1);
r11 = (N.*(w1-1)+rd1.*((w1.*x-x+1).^(N-1)-1))./(w1.*(w1.*x-x+1).^(N-1)-1);
r21 = (N.*(w2-1)+rd1.*((w2.*x-x+1).^(N-1)-1))./(w2.*(w2.*x-x+1).^(N-1)-1);
r12 = (N.*(w1-1)+rd2.*((w1.*x-x+1).^(N-1)-1))./(w1.*(w1.*x-x+1).^(N-1)-1);
r22 = (N.*(w2-1)+rd2.*((w2.*x-x+1).^(N-1)-1))./(w2.*(w2.*x-x+1).^(N-1)-1);
r13 = (N.*(w1-1)+rd3.*((w1.*x-x+1).^(N-1)-1))./(w1.*(w1.*x-x+1).^(N-1)-1);
r23 = (N.*(w2-1)+rd3.*((w2.*x-x+1).^(N-1)-1))./(w2.*(w2.*x-x+1).^(N-1)-1);

x211 = find(r21<=alpha);
r211 = 1.*r21;
r211(x211) = [];
theta211 = 1.*theta;
theta211(x211) = [];

x212 = find(r21>alpha+0.1);
r212 = 1.*r21;
r212(x212) = [];
theta212 = 1.*theta;
theta212(x212) = [];


x221 = find(r22<=alpha);
r221 = 1.*r22;
r221(x221) = [];
theta221 = 1.*theta;
theta221(x221) = [];

x222 = find(r22>alpha);
r222 = 1.*r22;
r222(x222) = [];
theta222 = 1.*theta;
theta222(x222) = [];


% figure(1)
% hold on
% plot(theta,r11,'Color',[0.95686 0.64314 0.37647],'LineWidth',1);
% hold on
% plot(theta211,r211,'-','Color',[0.2549 0.41176 0.8235],'LineWidth',1);
% plot(theta212,r212,'b--','Color',[0.2549 0.41176 0.8235],'LineWidth',1);
% plot(theta,x,'k-','LineWidth',1);
% 
% axis([0.5 4 0 3.5]);
% set(gca,'XTick',0.5:0.5:4);
% set(gca,'YTick',0:0.5:3.5);
% legend('r_{c}^{*}(w=0.8,r_{d}=0.1)',...
%     'r_{c}^{*}(w=1.2,r_{d}=0.1)',...
%     'r_{c}^{*}(inexistence)',...
%     'frequency of cooperators,x^{*}');
% box on
% 
% xlabel('θ');
% ylabel('multiplication of cooperators,r_{c} & frequency of cooperators,x^{*}');
% hold off

% figure(2)
% hold on
e11 = (r11.*w1-rd1).*(N-1).*(w1.*theta+1).^(N-2).*(w1-1)./((r11-alpha).*(beta-r11).*(w1.*(w1.*theta+1).^(N-1)-(1+theta).^(N-1)));
e21 = (r211.*w2-rd1).*(N-1).*(w2.*theta211+1).^(N-2).*(w2-1)./((r211-alpha).*(beta-r211).*(w2.*(w2.*theta211+1).^(N-1)-(1+theta211).^(N-1)));
e12 = (r12.*w1-rd2).*(N-1).*(w1.*theta+1).^(N-2).*(w1-1)./((r12-alpha).*(beta-r12).*(w1.*(w1.*theta+1).^(N-1)-(1+theta).^(N-1)));
e22 = (r221.*w2-rd2).*(N-1).*(w2.*theta221+1).^(N-2).*(w2-1)./((r221-alpha).*(beta-r221).*(w2.*(w2.*theta221+1).^(N-1)-(1+theta221).^(N-1)));
e13 = (r13.*w1-rd3).*(N-1).*(w1.*theta+1).^(N-2).*(w1-1)./((r13-alpha).*(beta-r13).*(w1.*(w1.*theta+1).^(N-1)-(1+theta).^(N-1)));
e23 = (r23.*w2-rd3).*(N-1).*(w2.*theta+1).^(N-2).*(w2-1)./((r23-alpha).*(beta-r23).*(w2.*(w2.*theta+1).^(N-1)-(1+theta).^(N-1)));

% plot(theta,e11,'-d','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);
% plot(theta,e12,'-o','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);
% plot(theta,e13,'-x','Color',[0.95686 0.64314 0.37647],'MarkerIndices',1:200:length(theta),'LineWidth',1);
% 
% plot(theta211,e21,'-d','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:40:length(theta),'LineWidth',1);
% plot(theta221,e22,'-o','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:200:length(theta),'LineWidth',1);
% plot(theta,e23,'-x','Color',[0.2549 0.41176 0.8235],'MarkerIndices',1:200:length(theta),'LineWidth',1);
% 
% legend('w=0.8,r_{d}=0.1',...
%     'w=0.8,r_{d}=0.8',...
%     'w=0.8,r_{d}=1.2',...
%     'w=1.2,r_{d}=0.1',...
%     'w=1.2,r_{d}=0.8',...
%     'w=1.2,r_{d}=1.2');
% 
% axis([0.5 4 0 8]);
% xlabel('θ');
% ylabel('threshold of feedback speed,\epsilon^{*}')
% box on
% hold off
% 
figure(3)
w = 0.5:0.01:1.5;
y = 1;
z = 1;
for i = 1:N-1
    y = y + w.^i;
end
for i = 1:N-2
    z = z + w.^i;
end
rd = ((alpha.*y)-N)./z;
p = [1 1 1 -5/3];
w0 = roots(p);
w0 = w0(imag(w0)==0);

hold on

w1 = 0.5:0.0001:w0;
r1 = 0.*w1+1.5;
w2 = w0:0.0001:1.5;
r2 = 0.*w2+1.5;

area(w1,r1,'FaceColor','[0.39216,0.58431,0.92941]');
area(w2,r2,'FaceColor','[0.95686,0.64314,0.37647]');
area(w,rd,'FaceColor','[0.56078,0.73725,0.56078]');

plot(w,rd,'k',[w0,w0],[0,1.5],'k','LineWidth',1);

% h=legend('$r_{d}^{*}=\frac{\alpha{(w^N-1)}-N{(w-1)}}{w^{N-1}-1}$',...
%     'w=0.7336(root of $\frac{\alpha{(w^N-1)}}{N{(w-1)}}$=0)'); %latex分式
% set(h,'Interpreter','latex') %设置legend为latex解释器显示分式

axis([0.5 1.5 0 1.5]);
set(gca,'XTick',0.5:0.25:1.5);
set(gca,'YTick',0:0.5:1.5);
xlabel('discounting and synergy factor,w');
ylabel('multiplication of deftors,r_{d}');
a3 = gca;
a3.Layer = 'top';
box on

hold off
% 
% 
% 
% 
