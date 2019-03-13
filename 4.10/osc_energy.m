% Returns the potential and kinetic energy of an oscillating system 
% as described in (4.43)–(4.44) in the book. Gives one plot showing how
% both energys evolve with time and how the sum of the energys evolve.

function osc_energy( u, v, t, omega)
p_e = 0.5*(omega^2)*(u.^2); % Calculates the potencial energy
k_e = 0.5*(v.^2); % Calculates the kinetic energy

plot(t, p_e, 'b:', t, k_e,'r:', t, p_e + k_e, 'k') % Plots both types of energy side by side and the total energy
   xlabel('t'); 
   ylabel('J');
   legend('Potencial energy','Kinetic energy','Total energy','location', 'northwest');
   
end
