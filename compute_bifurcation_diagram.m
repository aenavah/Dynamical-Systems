%% Bifurcation Diagram Function

%example call

% x_top = 5
% x_bottom = -5
% m_left = -5
% m_right = 5
% steps = 1001
% syms x m;
% f = @(m,x) m.*x.^2-m.^3;
% f1 = @(m,x) 2.*m.*x;


function compute_bifurcation_diagram(f,f1,x_top,x_bottom,m_left,m_right,steps)
xx=linspace(x_bottom,x_top,steps);
mm=linspace(m_left,m_right,steps);

[X,M]=meshgrid(xx,mm);

figure(1)
[cc,~]=contour(M,X,f(M,X),[0 0]);

close(1)

F1=f1(cc(1,:),cc(2,:));

idx1=F1>0; % unstable
idx2=F1<0; % stable

figure(1)
clf
AA=surf(M,X,f(M,X))
shading interp
alpha(0.8)
hold
plot3(cc(1,find(idx2)),cc(2,find(idx2)),zeros(size(cc(2,find(idx2)))),'b.');
plot3(cc(1,find(idx1)),cc(2,find(idx1)),zeros(size(cc(2,find(idx1)))),'r.');

axis([m_left m_right x_bottom x_top])
xlabel('$\mu$','Interpreter','Latex')
ylabel('$x$','Interpreter','Latex')
zlabel('$f(x,\mu)$','Interpreter','Latex')
set(gca,'Fontsize',20)
shading interp 
camlight

figure(2)
clf
plot(cc(1,find(idx2)),cc(2,find(idx2)),'b.')
hold
plot(cc(1,find(idx1)),cc(2,find(idx1)),'r.')

axis([m_left m_right x_bottom x_top])
xlabel('$\mu$','Interpreter','Latex')
ylabel('$x^*(\mu)$','Interpreter','Latex')
legend('stable','unstable')
grid
set(gca,'Fontsize',20)

%set(gca,'Xtick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])
%set(gca,'Ytick',[-5 -4 -3 -2 -1 0 1 2 3 4 5])

end
