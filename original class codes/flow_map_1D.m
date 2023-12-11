function flow_map_1D(f,xrange,trange)
%
% This function plots several trajectories
% of the dynamical system dx/dt= f(x)
% in the time interval [0,T] and also returns 
% the flow map X(t,x0) 

% f=@(t,x) sin(x); % right hand side of the ODE

% T   = 10;  % period of integration 
% nT  = 101;
% ts  = linspace(0,T,nT);
T   = trange(end);
nT  = length(trange);
ts  = trange;

% b   = 5*pi;
% Nic = 100;  % number of initial conditions in [-b,b]
% x0  = linspace(-b,b,Nic); % vector of initial conditions
Nic = length(xrange);
x0 = xrange;

options = odeset('RelTol',1e-13);
y=zeros(Nic,nT); % each row of this matrix represents a trajectory of dx/dt=f(x)

for ii=1:Nic
    [ts,y(ii,:)]=ode45(f,ts,x0(ii),options);   % ODE solver for each initial condition  
end

% Trajectories
figure(1)
clf
plot(ts,y,'b','Linewidth',1.5)
axis([0 T xrange(1) xrange(end)])

for jj=-3:1:2
    z=line([0 10],pi*[1 1]+2*jj*pi);
    set(z,'color','r','Linewidth',1.5,'Linestyle','--')
end

xlabel('$t$','Interpreter','Latex')
ylabel('$x(t)$','Interpreter','Latex')
set(gca,'Fontsize',20)
axis tight



% Flow map  
[X0,TT]= meshgrid (x0,ts);

figure(2)
clf
surf(X0,TT,y')
xlabel('$x_0$','Interpreter','Latex')
ylabel('$t$','Interpreter','Latex')
zlabel('$X(t,x_0)$','Interpreter','Latex')
set(gca,'Fontsize',20)
colorbar
axis tight

shading interp
box on
% view(0,90)
camlight

ZZ=y';

% Flow map sections
figure(3)
clf
hold on
plot(x0,ZZ(find(ts==10),:),'Linewidth',1.5)
plot(x0,ZZ(find(ts==20),:),'Linewidth',1.5)
plot(x0,ZZ(find(ts==30),:),'Linewidth',1.5)
plot(x0,ZZ(find(ts==40),:),'Linewidth',1.5)
h=legend('$t=10$','$t=20$','$t=30$','$t=40$');
set(gca,'Fontsize',20)
box
set(h,'Interpreter','Latex','Location','NorthWest')
axis([xrange(1) xrange(end) xrange(1)-1 xrange(end)+1])
axis([xrange(1) xrange(end) -100 100])
xlabel('$x_0$','Interpreter','Latex')
ylabel('$X(t,x_0)$','Interpreter','Latex')
end