%%%%%EXAM CODE%%%%%


%% Question 1

% BIFURCATION DIAGRAM
x_top = 2;
x_bottom = -2;
m_left = -2;
m_right = 2;
steps = 1001;
syms x m;
f = @(m,x) -x.^2 + x.^4 +m;
f1 = @(m,x) -2.*x + 4.*x.^3;
compute_bifurcation_diagram(f,f1,x_top,x_bottom,m_left,m_right,steps)


% %% Question 2
% 
% %PHASE PLANE
% ax=-4;
% ay=-4;
% bx=4;
% by=4;
% z=1;
% f1 = @(x,y,z) -.x + 2.*y 
% f2 = @(x,y,z) -.x
% A = [-1, 2; -1, 0] %use this only if you don't want eigenvectors plotted!
% %this matrix only produces imaginary eigenvectors which are ignored
% phase_plane(f1, f2, ax, ay, bx, by, z, A)


%% Question 4

%PHASE PLANE
% ax=-4;
% ay=-4;
% bx=4;
% by=4;
% z=1;
% m = 2
% f1 = @(x,y,z) 2.*x.*y -1
% f2 = @(x,y,z) -x.^2 - y.^2 + m
% %A = [-1, 2; -1, 0] %use this only if you don't want eigenvectors plotted!
% %this matrix only produces imaginary eigenvectors which are ignored
% phase_plane(f1, f2, ax, ay, bx, by, z, A)
% 
% m = 2

% SOLVE NULLCLINES
% syms x  y m
% [x_sol, y_sol, m_sol] = solve(2.*x.*y-1==0, -x.^2 - y.^2 + m, [x, y, m])
% latex([x_sol, y_sol])
%  [x_sol] = solve(x.^4-m.*x.^2 + 1./4 ==0, [x])
% latex([x_sol])

%% 4c
% syms x m;
% 
% roots = x.^4 - m.*x.^2 + 1./4 == 0;
% 
% x_sol = solve(roots, x);
% 
% m_values = -10:0.1:10;
% 
% x_star = zeros(length(m_values), length(x_sol));
% 
% for i = 1:length(m_values)
%     x_star(i, :) = subs(x_sol, m, m_values(i));
% end
% 
% figure;
% plot(m_values, x_star, 'LineWidth', 2);
% 
% xlabel('m');
% ylabel('x');
% title('Plot of x as a Function of m');

%% 
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