function [ tall, Rall] = calcTimeCourse( fun,conn, conn2 ,tau, g,odeOpt,initial)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tall=[];
Rall=[];
R1 = initial;
[t1,R1]=ode23(fun, [0 200],R1, odeOpt, conn, conn2,tau,g);
%Arguments of ODE23 goes as [t,y] = ode23(odefun,tspan,y0) tspan is the t
%interval over which the equation is integrated and y0 is the initial
%value.
tall=[tall;t1];
Rall=[Rall;R1];
end


