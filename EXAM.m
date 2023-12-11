%%%%%EXAM CODE%%%%%

% EXAMPLE CALLS ---------------
% BIFURCATION DIAGRAM
% x_top = 5;
% x_bottom = -5;
% m_left = -5;
% m_right = 5;
% steps = 1001;
% syms x m;
% f = @(m,x) m.*x.^2-m.^3;
% f1 = @(m,x) 2.*m.*x;
% compute_bifurcation_diagram(f,f1,x_top,x_bottom,m_left,m_right,steps)

% FLOW MAP 
% f=@(t,x) sin(x); 
% xrange = -10:0.1:10;
% trange = 0:0.1:50;
% flow_map_1D(f, xrange, trange)

% PHASE PLANE
% ax=-4;
% ay=-4;
% bx=4;
% by=4;
% z=1;
% f1 = @(x,y,z) -2.*x+4.*y 
% f2 = @(x,y,z) -4.*x -2.*y r
% A = [-2, 4; -4, -2] use this only if you don't want eigenvectors plotted!
% this matrix only produces imaginary eigenvectors which are ignored
% phase_plane(f1, f2, ax, ay, bx, by, z, A)

% EIGENVECTORS EIGENVALUES
% A = ([0, 1; -1, 0])
% [vs_A, lambdas_A] = eigs(A, 2)

% PARTIALS
% syms x m 
% f1 = 2.*m.*x;
% df_dx(x,m) = diff(f,x)
% df_dm(x,m) = diff(f, m)
% df2_dx2(x,m) = diff(df_dx, x)
% df2_dm2 = diff(df_dm, m)
% df_dmdx = diff(df_dm, x)
% df_dxdm = diff(df_dx, m)
% df3_dx3 = diff(df2_dx2, x)
%Plug in a point
% df3_dx3(0,0)

% SOLVE NULLCLINES
% [x_sol, m_sol] = solve(f==0, diff_f_rx==0, [x, m]);
%% 