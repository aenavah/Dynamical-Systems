function  phase_plane(f1, f2, ax, ay, bx, by,z, A)

% This function plots the phase portrait of an arbitrary 
% 2D nonlinear dynamical system, determines the nullclines 
% and plots the velocity field
%
%my example call----------------------------------------
% ax=-4;
% ay=-4;
% bx=4;
% by=4;
% z=1;
% f1 = @(x,y,z) -2.*x+4.*y 
% f2 = @(x,y,z) -4.*x -2.*y 
% A = [-2, 4; -4, -2] use this only if you don't want eigenvectors plotted!
% this matrix only produces imaginary eigenvectors which are ignored
% phase_plane(f1, f2, ax, ay, bx, by, z, A)
%-------------------------------------------------------
Nx1=20; 
Ny1=20;
xx1=linspace(ax,bx,Nx1);
yy1=linspace(ay,by,Ny1);
[X1,Y1]=meshgrid(xx1,yy1); %does all 

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

[vs, lambdas] = eigs(A, 2)
v1 = vs(:, 1)%*linspace(-ax,-bx,100); 
v2 = vs(:, 2)%*linspace(-ay,-by,100);


contour(X,Y,f1(X,Y,z),[0 0],'r','Linewidth',1.3); % nullcline dx/dt=0
contour(X,Y,f2(X,Y,z),[0 0],'k','Linewidth',1.3); % nullcline dy/dt=0


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

if any(imag(v1))
    disp('Eigenvector v1 has complex parts. Skipping v1 plotting.');
    v1 = [0; 0]; % Set v1 to zero if it has complex parts
end
if any(imag(v2))
    disp('Eigenvector v2 has complex parts. Skipping v2 plotting.');
    v2 = [0; 0]; % Set v2 to zero if it has complex parts
end

if nargin >= 8
    % Only plot v1 if it is real
    if ~any(imag(v1))
        quiver(0, 0, v1(1), v1(2), 'magenta', 'Linewidth', 1.5, 'DisplayName', 'v1');
    end

    % Only plot v2 if it is real
    if ~any(imag(v2))
        quiver(0, 0, v2(1), v2(2), 'green', 'Linewidth', 1.5, 'DisplayName', 'v2');
    end
end


end
