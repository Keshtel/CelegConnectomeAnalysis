function struct = SolveDE(ConnMat, tau, g, odeOptions, Initial)
%SOLVEDE this function is just for solving the dynamics and saving all
%activity and parameters of the model in one structure.
struct.tau = tau;
struct.g=g;
struct.Conn = ConnMat;
[struct.tall,struct.Rall] = calcTimeCourse(@Dynamics, ConnMat, tau, g, odeOptions, Initial);
end

