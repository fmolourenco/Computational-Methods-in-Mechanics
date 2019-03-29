t = 0:0.05:10;     % Time vector of the simulation
w = 1;             % Angular speed of OA [rad/s]
fi = pi/6 + w*t;   % Angle of OA
a = 0.1;           % Length of OA
b = 0.2;           % Length of AB
teta0 = 0;         % Some initial values for teta
d0 = 0.15;         % Some initial values of the distance of B
j =  @(x)[-b*sin(x(1)),-1;-b*cos(x(1)),0];   % Jacobian Matrix, x(1)-fi
ft = @(x)[-a*w*sin(x(1));a*w*cos(x(1))];     % ft Matrix, x(1)-fi
G = @(x)[-a*(x(1)^2)*cos(x(2))-b*((x(3))^2)*cos(x(4));-a*((x(1))^2)*sin(x(2))+b*((x(3)^2)*sin(x(4)))]; % G Matrix, x(1)-angular velocity, x(2)-fi, x(3)-first derivative of teta, x(4)-teta

 % Teta and d
teta_d = zeros(2,length(t)); % Creates the empty Matrix for teta and d values 
for i = 1:length(t)
 f = @(x)[a*cos(fi(i))+b*cos(x(1))-x(2);a*sin(fi(i))-b*sin(x(1))]; % Gives the apropriate values to the function f 
 teta_d(:,i) = NR_method(f, j, [teta0;d0], 10^-8);
end
     
 % First derivative teta and first derivative d
tetaI_dI = zeros(2,length(t)); % Creates the empty Matrix for first derivative teta and first derivative d values 
for i = 1:length(t)
  tetaI_dI(:,i) = (j(teta_d(1,i)))\-ft(fi(i));
end                 

 % Second derivative teta and second derivative d
tetaII_dII= zeros(2,length(t)); % Creates the empty Matrix for second derivative teta and second derivative d values
for i = 1:length(t) 
  x = [w fi(i) tetaI_dI(1,i) teta_d(1,i)]; % Gives the apropriate values to the function G
  tetaII_dII(:,i) = (j(teta_d(1,i)))\-G(x);
end                 

 % Ploting teta and d with time
figure;
yyaxis left;
plot(t,teta_d(2,:));
xlabel('t'); 
ylabel('distance of B [m]');
 
yyaxis right;
plot(t,teta_d(1,:));
xlabel('t'); 
ylabel('teta of AB [radians]');

 % Ploting the first derivative of teta and the first derivative d with time
figure;
yyaxis left;
plot(t,tetaI_dI(2,:));
xlabel('t'); 
ylabel('Velocity of B [m]');
 
yyaxis right;
plot(t,tetaI_dI(1,:));
xlabel('t'); 
ylabel('First derivative of teta[radians/s]');

 % Ploting the second derivative of teta and the second derivative d with time
figure;
yyaxis left;
plot(t,tetaII_dII(2,:));
xlabel('t'); 
ylabel('Acceleration of B [m]');
 
yyaxis right;
plot(t,tetaII_dII(1,:));
xlabel('t'); 
ylabel('Second derivative of teta [radians/s^2]');


