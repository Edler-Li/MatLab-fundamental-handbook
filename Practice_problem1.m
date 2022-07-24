function Practice_problem1

%Problem 1----------------
x = -4:0.01:2;
y = sin(exp(x))./(1 + x.^2)

figure(1);
plot(x, y, "b.")
title("Graph of $f(x)= \frac{sin(e^{-x}}{1+x^2} $", "Interpreter","latex")


%Problem 2-----------------
xx = -5:0.1:5;
yy = -5:0.1:5;

[X, Y] = meshgrid(xx, yy);

Z = sin(X.*Y) ./ exp(-(X.^2 + Y.^2));

figure(2);
surf(X, Y, Z);
title("Graph of $f(x,y)= sin(xy)e^{-(x^2+y^2)}$","Interpreter","latex")


%Problem 3------------------


R = -10:0.1:10;
[X, Y] = meshgrid(R, R);
c1 = 3*X + 7*Y <= 13
c2 = 4*X + 5*Y <= 14
c3 = 3*X - 2*Y >= 9
c4 = 4*X + 5*Y >= 1

F = zeros(length(R));
F(~(c1 & c2 &c3 &c4)) = 2

figure(3)

imagesc(F, "xdata", R, "ydata", R);
grid on;
axis on;
set(gca, "YDir", "normal");
colormap("parula");


%%Problem4----------------

syms x y
eqn1 = 3*x + 7*y == 13;
eqn2 = 4*x + 5*y == 14;
eqn3 = 3*x - 2*y == 9;
eqn4 = 4*x + 5*y == 1;

sol = solve([eqn1, eqn2, eqn3, eqn4], [x, y]);
xSol = sol.x
ySol = sol.y


% find the point and move the axise in the traditional direction and
% origin
end
