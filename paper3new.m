% clc,clear
%load('paper3fenlei.mat')
theta = 2;
rd = 1;
N = 4;
c = 1;
alpha = 1.5;
beta = 3.5;
w1 = 0.8;
w2 = 1;
w3 = 1.2;
xt = theta/(theta+1);
r1 = (N*(w1-1)+rd*((w1*xt-xt+1)^(N-1)-1))/(w1*(w1*xt-xt+1)^(N-1)-1);
e1 = (r1*w1-rd)*(N-1)*(w1*theta+1)^(N-2)*(w1-1)/(r1-alpha)/(beta-r1)/(w1*(w1*theta+1)^(N-1)-(1+theta)^(N-1));
r2 = (theta*rd*(N-1)+N*(theta+1))/(theta*(N-1)+theta+1);
e2 = ((1-xt)*(N-1)*(r2-rd))/(((N-1)*xt+1)*(r2-alpha)*(beta-r2));
r3 = (N*(w3-1)+rd*((w3*xt-xt+1)^(N-1)-1))/(w3*(w3*xt-xt+1)^(N-1)-1);
e3 = (r3*w3-rd)*(N-1)*(w3*theta+1)^(N-2)*(w3-1)/(r3-alpha)/(beta-r3)/(w3*(w3*theta+1)^(N-1)-(1+theta)^(N-1));

h = 0.03;
tf = 400;%Ê±¼ä
options = odeset('MaxStep', 1e-1, 'RelTol',1e-1,'AbsTol',1e-3);
step = floor(1/h)-1;

% %%
% %subplot(3,3,1);
% figure(1)
% hold on;
% xx1 = zeros((tf*40+1)*step*step,2);
% mycolor1 = zeros((tf*40+1)*step,1);
% for i = 1:step
%     for j = 1:step
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1-0.2,theta,rd,N,c);
%         xx1(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor1(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);  
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01
%             mycolor1(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
%         else
%             mycolor1(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
%         end
%         hold on
%         arrowPlot(X,R,'number', 5,'color', 'k', 'LineWidth', 0.2, 'scale', 0.1);
%     end
% end
% quyufenlei(xx1,mycolor1,h,tf);
% 
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)-rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% dr=(e1-0.2).*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% h1 = streamslice(X,R,dx,dr);
% axis tight
% set( h1, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% ylabel('multiplication of cooperators,r_{c}');
% xlabel('frequency of cooperators, x');
% title({['w = ',num2str(w1)],['( \epsilon^{*} = ',num2str(e1),' )']});
% a1 = gca;
% a1.Layer = 'top';
% box on
% hold off

% %%
% subplot(3,3,2);
% figure(2) 
% hold on;
% % xx2 = zeros((tf*40+1)*step*step,2);
% % mycolor2 = zeros((tf*40+1)*step,1);
% % for i = 1:step
% %     for j = 1:step
% %         x_0 = h*i;
% %         r_0 = 1.5+2*h*j;
% %         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2-0.2,theta,rd,N,c);
% %         xx2(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
% %         X=x(:,1);
% %         R=x(:,2);
% %         if X(end) > 1-exp(-6)
% %             mycolor2(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);            
% %         elseif X(end) < exp(-6)
% %             mycolor2(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
% %         else
% %             mycolor2(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
% %         end
% %         hold on
% %     end
% % end
% quyufenlei(xx2,mycolor2,h,tf);
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*(((1+(N-1).*X)./N.*R-1)-rd.*(N-1).*X./N);
% dr=(e2-0.2).*(R-1.5).*(3.5-R).*(-X.*c.*((1+(N-1).*X)./N.*R-1)+theta.*(1-X).*c.*rd.*(N-1).*X./N);
% h2 = streamslice(X,R,dx,dr);
% axis tight
% set( h2, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% title({['w = ',num2str(w2)],['( \epsilon^{*} = ',num2str(e2),' )']});
% xlabel('frequency of cooperators, x');
% a2 = gca;
% a2.Layer = 'top';
% box on;
% hold off
% % 
% %%
% subplot(3,3,3);
% figure(3)
% hold on;
% 
% % xx3 = zeros((tf*40+1)*step*step,2);
% % mycolor3 = zeros((tf*40+1)*step*step,1);
% % for i = 1:step
% %     for j = 1:step
% %         x_0 = h*i;
% %         r_0 = 1.5+2*h*j;
% %         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3-0.2,theta,rd,N,c);
% %         xx3(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
% %         X=x(:,1);
% %         R=x(:,2);
% %         if X(end) > 1-exp(-6)
% %             mycolor3(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);            
% %         elseif X(end) < exp(-6)
% %             mycolor3(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
% %         else
% %             mycolor3(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
% %         end
% %         hold on
% %     end
% % end
% quyufenlei(xx3,mycolor3,h,tf);
% 
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)-rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% dr=(e3-0.2).*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% h3 = streamslice(X,R,dx,dr);
% axis tight
% set( h3, 'Color', [0 0 0] )
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
%title({['w = ',num2str(w3)],['( \epsilon^{*} = ',num2str(e3),' )']});
% a3 = gca;
% a3.Layer = 'top';
% box on;
% hold off
% % 
% %%
% subplot(3,3,4);
% figure(4)
% hold on;
% % 
% xx4 = zeros((tf*40+1)*step*step,2);
% mycolor4 = zeros((tf*40+1)*step*step,1);
% for i = 1:step
%     for j = 1:step
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1,theta,rd,N,c);
%         xx4(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor4(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);  
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01 && R(end)>r1-0.01 && R(end)<r1+0.01
%             mycolor4(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
%         else
%             mycolor4(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
%         end
%         hold on
%     end
% end
% quyufenlei(xx4,mycolor4,h,tf);
% 
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)-rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% dr=e1.*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% h4 = streamslice(X,R,dx,dr);
% axis tight
% set( h4, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% ylabel('multiplication of cooperators,r_{c}');
% xlabel('frequency of cooperators, x');
% a4 = gca;
% a4.Layer = 'top';
% box on;
% hold off
% % 
% %%
% subplot(3,3,5);
% figure(5)
% hold on;
% 
% xx5 = zeros((tf*40+1)*step*step,2);
% mycolor5 = zeros((tf*40+1)*step*step,1);
% for i = 1:step
%     for j = 1:step
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2,theta,rd,N,c);
%         xx5(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor5(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);  
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01 && R(end)>r2-0.02 && R(end)<r2+0.02
%             mycolor5(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
%         else
%             mycolor5(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
%         end
%         hold on
%     end
% end
% for i = 1:10
%     for j =1:10
%         x_0 = xt-0.01+0.002*i;
%         r_0 = r2-0.02+0.004*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2,theta,rd,N,c);
%         xx5(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor5(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=ones(size(x,1),1);
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01 && R(end)>r2-0.02 && R(end)<r2+0.02
%             mycolor5(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=3*ones(size(x,1),1);
%         else
%             mycolor5(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=2*ones(size(x,1),1);
%         end
%         hold on
%     end
% end
% quyufenlei(xx5,mycolor5,h,tf);
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*(((1+(N-1).*X)./N.*R-1)-rd.*(N-1).*X./N);
% dr=e2.*(R-1.5).*(3.5-R).*(-X.*c.*((1+(N-1).*X)./N.*R-1)+theta.*(1-X).*c.*rd.*(N-1).*X./N);
% h5 = streamslice(X,R,dx,dr);
% axis tight
% set( h5, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
% a5 = gca;
% a5.Layer = 'top';
% box on
% hold off
% % 
% %%
% subplot(3,3,6);
% figure(6)
% hold on;
% 
% xx6 = zeros((tf*40+1)*step*step,2);
% mycolor6 = zeros((tf*40+1)*step,1);
% for i = 1:step
%     for j = 1:step
%         x_0 = h*i;
%         r_0 = 1.5+2*h*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3,theta,rd,N,c);
%         xx6(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor6(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x,1),1);  
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01 && R(end)>r3-0.01 && R(end)<r3+0.01
%             mycolor6(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x,1),1);
%         else
%             mycolor6(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x,1),1);
%         end
%         hold on
%     end
% end
% quyufenlei(xx6,mycolor6,h,tf);
% 
% for i = 1:10
%     for j =1:10
%         x_0 = xt-0.01+0.002*i;
%         r_0 = r2-0.02+0.004*j;
%         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3,theta,rd,N,c);
%         xx6(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:) = x(1:(tf*40+1),:);
%         X=x(:,1);
%         R=x(:,2);
%         if X(end) > 1-exp(-6)
%             mycolor6(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=ones(size(x,1),1);
%         elseif X(end)>xt-0.01 && X(end)<xt+0.01 && R(end)>r3-0.02 && R(end)<r3+0.02
%             mycolor6(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=3*ones(size(x,1),1);
%         else
%             mycolor6(((i-1)*10+j-1)*(tf*40+1)+1+(tf*40+1)*step*step:((i-1)*10+j)*(tf*40+1)+(tf*40+1)*step*step,:)=2*ones(size(x,1),1);
%         end
%         hold on
%     end
% end
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)-rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% dr=e3.*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% h6 = streamslice(X,R,dx,dr);
% axis tight
% set( h6, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
% a6 = gca;
% a6.Layer = 'top';
% box on;
% hold off
% 
% %%
% subplot(3,3,7);
% figure(7)
% hold on;
% 
% % xx7 = zeros((tf*40+1)*step*step,2);
% % mycolor7 = zeros((tf*40+1)*step,1);
% % for i = 1:step
% %     for j = 1:step
% %         x_0 = h*i;
% %         r_0 = 1.5+2*h*j;
% %         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w1,e1+0.5,theta,rd,N,c);
% %         xx7(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
% %         X=x(:,1);
% %         R=x(:,2);
% %         if X(end) > 1-exp(-6)
% %             mycolor7(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x(1:(tf*40+1),:),1),1);            
% %         elseif X(end) < exp(-6)
% %             mycolor7(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x(1:(tf*40+1),:),1),1);
% %         else
% %             mycolor7(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x(1:(tf*40+1),:),1),1);
% %         end
% %         hold on
% %     end
% % end
% quyufenlei(xx7,mycolor7,h,tf);
% 
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)-rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% dr=(e1+0.5).*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w1).*(1-w1.*(1-X+w1.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w1).*(1-(1-X+w1.*X).^(N-1)));
% h7 = streamslice(X,R,dx,dr);
% axis tight
% set( h7, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
% ylabel('multiplication of cooperators,r_{c}');
% a7 = gca;
% a7.Layer = 'top';
% box on;
% hold off
% % 
% %%
% subplot(3,3,8);
% figure(8)
% hold on;
% 
% % xx8 = zeros((tf*40+1)*step*step,2);
% % mycolor8 = zeros((tf*40+1)*step,1);
% % for i = 1:step
% %     for j = 1:step
% %         x_0 = h*i;
% %         r_0 = 1.5+2*h*j;
% %         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w2,e2+0.5,theta,rd,N,c);
% %         xx8(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
% %         X=x(:,1);
% %         R=x(:,2);
% %         if X(end) > 1-exp(-6)
% %             mycolor8(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x(1:(tf*40+1),:),1),1);            
% %         elseif X(end) < exp(-6)
% %             mycolor8(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x(1:(tf*40+1),:),1),1);
% %         else
% %             mycolor8(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x(1:(tf*40+1),:),1),1);
% %         end
% %         hold on
% %     end
% % end
% quyufenlei(xx8,mycolor8,h,tf);
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*(((1+(N-1).*X)./N.*R-1)-rd.*(N-1).*X./N);
% dr=(e2+0.5).*(R-1.5).*(3.5-R).*(-X.*c.*((1+(N-1).*X)./N.*R-1)+theta.*(1-X).*c.*rd.*(N-1).*X./N);
% h8 = streamslice(X,R,dx,dr);
% axis tight
% set( h8, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
% a8 = gca;
% a8.Layer = 'top';
% box on;
% hold off
% 
% %%
% subplot(3,3,9);
% figure(9)
% hold on;
% 
% % xx9 = zeros((tf*40+1)*step*step,2);
% % mycolor9 = zeros((tf*40+1)*step,1);
% % for i = 1:step
% %     for j = 1:step
% %         x_0 = h*i;
% %         r_0 = 1.5+2*h*j;
% %         [t,x]=ode45(@equs,[0,tf],[x_0;r_0],options,w3,e3+0.5,theta,rd,N,c);
% %         xx9(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:) = x(1:(tf*40+1),:);
% %         X=x(:,1);
% %         R=x(:,2);
% %         if X(end) > 1-exp(-6)
% %             mycolor9(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=ones(size(x(1:(tf*40+1),:),1),1);            
% %         elseif X(end) < exp(-6)
% %             mycolor9(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=2*ones(size(x(1:(tf*40+1),:),1),1);
% %         else
% %             mycolor9(((i-1)*step+j-1)*(tf*40+1)+1:((i-1)*step+j)*(tf*40+1),:)=3*ones(size(x(1:(tf*40+1),:),1),1);
% %         end
% %         hold on
% %     end
% % end
% quyufenlei(xx9,mycolor9,h,tf);
% 
% hold on
% [X,R] = meshgrid(0:0.001:1,1.5:0.002:3.5);
% dx=X.*(1-X).*c.*((R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)-rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% dr=(e3+0.5).*(R-1.5).*(3.5-R).*(-X.*c.*(R ./ N ./(1-w3).*(1-w3.*(1-X+w3.*X).^(N-1))-1)+theta.*(1-X).*c.*rd ./ N ./(1-w3).*(1-(1-X+w3.*X).^(N-1)));
% h9 = streamslice(X,R,dx,dr);
% axis tight
% set( h9, 'Color', [0 0 0] )
% 
% axis([0 1 1.5 3.5]);
% set(gca,'XTick',0:0.25:1);
% set(gca,'YTick',1.5:0.5:3.5);
% xlabel('frequency of cooperators, x');
% %set(gca,'XAxisLocation','origin')
% a9 = gca;
% a9.Layer = 'top';
% box on
% hold off