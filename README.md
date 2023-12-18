# Nonlinear Dynamical Systems

# Bifurcation Diagram

x_top = 2;
x_bottom = -2;
m_left = -2;
m_right = 2;
steps = 1001;
syms x m;
f = @(m,x) -x.^2 + x.^4 +m;
f1 = @(m,x) -2.*x + 4.*x.^3;
compute_bifurcation_diagram(f,f1,x_top,x_bottom,m_left,m_right,steps)

# Phase Plane

ax=-4;
ay=-4;
bx=4;
by=4;
z=1;
m = 2
f1 = @(x,y,z) 2.*x.*y -1
f2 = @(x,y,z) -x.^2 - y.^2 + m
%A = [-1, 2; -1, 0] %use this only if you don't want eigenvectors plotted!
%this matrix only produces imaginary eigenvectors which are ignored
phase_plane(f1, f2, ax, ay, bx, by, z, A)

# Flow Map

% f=@(t,x) sin(x);
% xrange = -10:0.1:10;
% trange = 0:0.1:50;
% flow_map_1D(f, xrange, trange)
