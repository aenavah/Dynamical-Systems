%
% Supporting code for AM114/214 
%
% Author: Georgiy Antonovich Bondar
% Date:   10-12-2023
%
clear all; close all;
%% Question 1(1)
% Plot f(x) vs. x
syms x;
f(x) = atan(x^3-x);
figure(1);
fplot(f(x),[-1.5 1.5], 'linewidth', 2, 'color', 'k');
hold on;
grid on;
ylim([-0.6 0.6]);
xlabel("x");
ylabel("dx/dt");
hold off;


%%
% Plot vector field for varying ICs
x0span = -2:0.1:2;
tspan  = 0:0.01:3;
figure(2);
hold on
for x0 = x0span
    [t,x] = ode15s(@(t,x) atan(x^3-x),tspan,x0);
    if ismember(x0,[0,1,-1])
        plot(t,x, 'k', 'linewidth', 3);
    else
        plot(t,x);
    end
end
xlim([0 3])
ylim([-2 2])
xlabel("t")
ylabel("x(t)")
title('$$f(x)=\arctan(x^3-x)$$','interpreter','latex')


%% Question 4
% Plot vector field for varying ICs
x0span = -3:0.1:3;
tspan  = 0:0.01:3;
figure(3);
hold on
for x0 = x0span
    [t,x] = ode15s(@(t,x) 1-x^2,tspan,x0);
    if ismember(x0,[1,-1])
        plot(t,x, 'k', 'linewidth', 3);
    elseif x0==-2
        p1 = plot(t,x,'b', 'linewidth', 3);
    elseif x0==-1/2
        p2 = plot(t,x,'g', 'linewidth', 3);
    elseif x0==2
        p3 = plot(t,x,'r', 'linewidth', 3);
    else
        plot(t,x);
    end
end
xlim([0 3])
ylim([-3 3])
xlabel("t")
ylabel("x(t)")
title('$$f(x)=1-x^2$$','interpreter','latex')
h=legend([p1 p2 p3], '$x_0=-2$','$x_0=-1/2$','$x_0=2$','interpreter','latex');


%% Question 8
xrange = -30:0.1:30;
trange = 0:0.1:50;
f = @(t,x) atan(x^3-x);
% flow_map_1D(f,xrange,trange);
inverse_flow_map_1D(f,xrange,trange);


