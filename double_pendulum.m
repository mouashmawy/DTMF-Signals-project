syms t m1 m2 l1 l2 angle1(t) angle2(t) g ;
x1=l1 *sin(angle1);
y1=-l1*cos(angle1);
x2 = l1 *sin(angle1) +l2 *sin(angle2);
y2 = -l1 *cos(angle1)-l2 *cos(angle2);
%the velocity
x1d=diff(x1);
y1d=diff(y1);
x2d=diff(x2);
y2d=diff(y2);
%the kinetic energy
T=(1/2)*m1*(x1d^2+y1d^2)+(1/2)*m2*(x2d^2+y2d^2);
T=simplify(T);
%the potential energy
V=m1*g*y1+m2*g*y2;
V=simplify(V);
%lagrange
L=T-V;
L=simplify(L);
%eular equation for angle one  
angel1d=diff(angle1);
pdlad1=diff(L,angel1d);
pdlad1=simplify(pdlad1);
dtpdlad1=diff(pdlad1);
dtpdlad1=simplify(dtpdlad1);
pdlangle1=diff(L,angle1);
pdlangle1=simplify(pdlangle1);
eqangle1=(dtpdlad1-pdlangle1)==0;
eqangle1=eqangle1/l1;
%eular equation for angle two
angel2d=diff(angle2);
pdlad2=diff(L,angel2d);
pdlad2=simplify(pdlad2);
dtpdlad2=diff(pdlad2);
dtpdlad2=simplify(dtpdlad2);
pdlangle2=diff(L,angle2);
pdlangle2=simplify(pdlangle2);
eqangle2=(dtpdlad2-pdlangle2)==0;
eqangle2=(eqangle2)/(l2);
%constant
l1=1;
l2=1.5;
m1=2;
m2=1;
g=9.8;
eqn1=subs(eqangle1);
eqn2=subs(eqangle2);
%solving the ode equations
[V,S] = odeToVectorField(eqn1,eqn2);
M = matlabFunction(V,'vars',{'t','Y'});
initCond1 = [pi/4 0 pi/6 0];
sols1 = ode45(M,[0 10],initCond1);
initCond2 = [pi/2 0 pi/3 0];
sols2 = ode45(M,[0 10],initCond2);
initCond3 = [pi/3 0 pi/2 0];
sols3 = ode45(M,[0 10],initCond3);
figure(1)
plot(sols1.x,sols1.y(3,:))
hold on;
plot (sols2.x,sols2.y(3,:))
plot (sols3.x,sols3.y(3,:))
xlabel('Time','color','b')
ylabel('theta1','color','b')
legend('\theta_1 first situation','\theta_1 second situation','\theta_1 third situation')
hold off 
figure(2)
plot(sols1.x,sols1.y(1,:))
hold on;
plot (sols2.x,sols2.y(1,:))
plot (sols3.x,sols3.y(1,:))
xlabel('Time','color','b')
ylabel('theta2','color','b')

legend('\theta_2 first situation','\theta_2 second situation','\theta_2 third situation')
hold off 
% the anime 
% x_1 = @(t) l1*sin(deval(sols1,t,3));
% y_1 = @(t) -l1*cos(deval(sols1,t,3));
% x_2 = @(t) l1*sin(deval(sols1,t,3))+l2*sin(deval(sols1,t,1));
% y_2 = @(t) -l1*cos(deval(sols1,t,3))-l2*cos(deval(sols1,t,1));
% fanimator(@(t) plot(x_1(t),y_1(t),'ro','MarkerSize',m1*10,'MarkerFaceColor','r'));
% axis equal;
% hold on;
% fanimator(@(t) plot([0 x_1(t)],[0 y_1(t)],'r-'));
% fanimator(@(t) plot(x_2(t),y_2(t),'go','MarkerSize',m2*10,'MarkerFaceColor','g'));
% fanimator(@(t) plot([x_1(t) x_2(t)],[y_1(t) y_2(t)],'g-'));
% fanimator(@(t) text(-0.3,0.3,"Timer: "+num2str(t,2)));
% hold off;
% playAnimation()
% x_1 = @(t) l1*sin(deval(sols2,t,3));
% y_1 = @(t) -l1*cos(deval(sols2,t,3));
% x_2 = @(t) l1*sin(deval(sols2,t,3))+l2*sin(deval(sols2,t,1));
% y_2 = @(t) -l1*cos(deval(sols2,t,3))-l2*cos(deval(sols2,t,1));
% fanimator(@(t) plot(x_1(t),y_1(t),'ro','MarkerSize',m1*10,'MarkerFaceColor','r'));
% axis equal;
% % hold on;
% % fanimator(@(t) plot([0 x_1(t)],[0 y_1(t)],'r-'));
% % fanimator(@(t) plot(x_2(t),y_2(t),'go','MarkerSize',m2*10,'MarkerFaceColor','g'));
% % fanimator(@(t) plot([x_1(t) x_2(t)],[y_1(t) y_2(t)],'g-'));
% % fanimator(@(t) text(-0.3,0.3,"Timer: "+num2str(t,2)));
% % hold off;
% % playAnimation()
% % x_1 = @(t) l1*sin(deval(sols3,t,3));
% % y_1 = @(t) -l1*cos(deval(sols3,t,3));
% % x_2 = @(t) l1*sin(deval(sols3,t,3))+l2*sin(deval(sols3,t,1));
% % y_2 = @(t) -l1*cos(deval(sols3,t,3))-l2*cos(deval(sols3,t,1));
% % fanimator(@(t) plot(x_1(t),y_1(t),'ro','MarkerSize',m1*10,'MarkerFaceColor','r'));
% % axis equal;
% % hold on;
% % fanimator(@(t) plot([0 x_1(t)],[0 y_1(t)],'r-'));
% % fanimator(@(t) plot(x_2(t),y_2(t),'go','MarkerSize',m2*10,'MarkerFaceColor','g'));
% % fanimator(@(t) plot([x_1(t) x_2(t)],[y_1(t) y_2(t)],'g-'));
% % fanimator(@(t) text(-0.3,0.3,"Timer: "+num2str(t,2)));
% % hold off;
% % playAnimation()
% % writeAnimation("New Rich Text Document.gif")
