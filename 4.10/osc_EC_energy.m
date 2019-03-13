% Plots the sum of the kinetic and potential energy using the Euler-Cromer
% method. The values for this 1D oscillating mass-spring system are the
% same the ones indicated in slide 27 of the powerpoint of 4/3/2019

omega = 2;                           % Natural frequency 
P = (2*pi)/omega;                    % Oscillation period
delta_t = P/200;                     % Size of the time interval at each step
T = 3*P;                             % Duration of the system  
N_t = floor(T/delta_t);              % Rounds the number of points
t = linspace(0, N_t*delta_t, N_t+1); % Creates the time vector
u = zeros(N_t+1, 1);                 % Creates an empty position vector
v = zeros(N_t+1, 1);                 % Creates an empty velocity vector

X_0 = 2;    % First value of the position
u(1) = X_0;
v(1) = 0;   % First value of the velocity


for n = 1:N_t % Euler-Cromer method
    v(n+1) = v(n) - delta_t*omega^2*u(n); 
    u(n+1) = u(n) + delta_t*v(n+1);
end



osc_energy( u, v, t, omega)