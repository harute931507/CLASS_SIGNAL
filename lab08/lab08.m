time = [0 0.6e-6];
y0 = [0 0];
[t,y] = ode45(@rlc, time, y0);
plot(t,y(:,1))

function  dydt = rlc(t,y)
    R = 1.0;
    L = 100 * 10^-9;
    C = 1.0 * 10^-9;
    
    dydt = [y(2); (- R * y(2) - 1/C * y(1) + 1) / L ];
end



% L * q'' + R * q' + 1/C * q = 1
% let y1 = q, y2 = q'
% then
% y1' = y2
% y2' = (- R * y2 - 1/C * y1 + 1) * (1/L) 