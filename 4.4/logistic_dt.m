% Compute the numerical solution of the logistic equation for a set of repeatedly
% halved time steps, also plots the solutions corresponding to the last two 
% time steps Delta_t_k and Delta_t_k-1 in the same plot



N_0 = 100;              % Initial value of the population
initial_delta_t = 5;    % Initial interval of time (months)
T = 60;                 % Maximum time (months)
r = 0.1;                % Constant
M = 500;                % Carrying capacity of the population
f = @(t,N) r*(1-N/M)*N; 

i = -1; % Starts with -1 so that it the firt value of i is 0 inside the loop
more = 1;
 while(more==1) % If it changes value from 1 the loop will end
   i = i + 1;
   delta_t_k = (2^-i)*initial_delta_t;
   [t1, u1] = ode_FE(f, [delta_t_k, T], N_0);
   [t2, u2] = ode_FE(f, [delta_t_k/2, T], N_0);
   plot(t2, u2, t1, u1, 'm--')
   xlabel('t'); 
   ylabel('N(t)');
   legend('Delta t_(_k_)', 'Delta t_(_k_-_1_)','location', 'northwest')
   more = input(['Your Delta_t_k is ' num2str(delta_t_k/2) ', do you want more? (1 for yes/any other number to no)--> ']); % Allows the user to terminate the program, or continue with greater precision
 end
 

 
 