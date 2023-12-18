function  manifold_phase_plane(f1, f2, ax, ay, bx, by, z, t, x_manifold, y_manifold)

% This function plots the phase portrait of an arbitrary 
% 2D nonlinear dynamical system, determines the nullclines 
% and plots the velocity field
% and plots center manifold
% does not plot eigens!

%example:
% initialize
% ax=-4;
% ay=-4;
% bx=4;
% by=4;
% z=1;
% t = linspace(ax, bx, 100);  % Adjust the range and number of points as needed
% x_manifold = 0;
% y_manifold = 0;

%call
% f1 = @(x,y,z) x - y - x.^2 + x.*y  
% f2 = @(x,y,z) -(x.^2) - y
% 
% manifold_phase_plane(f1, f2, ax, ay, bx, by, z, t, x_manifold, y_manifold)
%-------------------------------------------------------
Nx1=20; 
Ny1=20;
xx1=linspace(ax,bx,Nx1);
yy1=linspace(ay,by,Ny1);
[X1,Y1]=meshgrid(xx1,yy1);%does all 

% We use X,Y for computing the nullclines and the trajectories
Nx=200; 
Ny=200;
xx=linspace(ax,bx,Nx);
yy=linspace(ay,by,Ny);
[X,Y]=meshgrid(xx,yy); 

fontsize=22;
figure(1)
clf
hold
box on


if y_manifold == (-1./2)*(t) + t.^2+4.*t.^3;
    plot([0, 0], [ax, bx], 'k', 'LineWidth', 1.3, 'DisplayName', '$\dot{x}_1 = 0$'); %nullcline dy/dt = 0 x = 0
else
    contour(X,Y,f2(X,Y,z),[0 0],'k','Linewidth',1.3); % nullcline dy/dt=0
end
contour(X,Y,f1(X,Y,z),[0 0],'r','Linewidth',1.3); % nullcline dx/dt=0


% Here we plot the trajectories 
X0 = rand(400,2);
X0(:,1)= ax + (bx-ax)*X0(:,1);
X0(:,2)= ay + (by-ay)*X0(:,2);

streamline(X,Y,f1(X,Y,z),f2(X,Y,z),X0(:,1),X0(:,2),[5e-3,1e4])



xlabel('$x_1$','Interpreter','Latex','Fontsize',fontsize)
ylabel('$x_2$','Interpreter','Latex','Fontsize',fontsize)
set(gca,'Fontsize',fontsize)
axis tight

% Here we plot the velocity field 
quiver(X1,Y1,f1(X1,Y1,z),f2(X1,Y1,z),'k','Linewidth',1.2)

leg=legend('$\dot{x}_1=0$','$\dot{x}_2=0$');
set(leg,'Interpreter','Latex')
%axis equal
set(gca,'Xtick',[-6 -4 -2 0 2 4 6])
set(gca,'Ytick',[-6 -4 -2 0 2 4 6])




in_bounds = (x_manifold >= ax) & (x_manifold <= bx) & (y_manifold >= ay) & (y_manifold <= by);

plot(x_manifold(in_bounds), y_manifold(in_bounds), 'b', 'LineWidth', 2, 'DisplayName', 'Center Manifold');



end
