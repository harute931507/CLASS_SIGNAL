fun1 = @(x) x.^3;
range = 0:10;
integral(fun1, 0, 10)
plot(range,fun1(range));


tspan = 0:5;
y0 = 0;
[t,y] = ode45(@fun2,tspan,y0);
figure
plot(t,y)

function dydt = fun2(t,y)
    dydt = (- y(1) - u(t) + 1)/3;
end

function result = u(t)
    if t < 1 
        result = 0;
    else
        result = 1;
    end
end
