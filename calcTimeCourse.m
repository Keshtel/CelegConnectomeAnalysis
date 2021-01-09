function [ tall, Rall] = calcTimeCourse( fun,conn ,tau, g,odeOpt,inital,CellVector )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
tall=[];
Rall=[];
R1 = inital;
[t1,R1]=ode23(fun, [1:1000],R1, odeOpt, conn,tau,g);
%Arguments of ODE23 goes as [t,y] = ode23(odefun,tspan,y0) tspan is the t
%interval over which the equation is integrated and y0 is the initial
%value. R1(end,:) gives the initial value at the beginning of tStim{i}
%interval. not that R1 also updates
%of the function needed to be solved
tall=[tall;t1];
Rall=[Rall;R1];
end


