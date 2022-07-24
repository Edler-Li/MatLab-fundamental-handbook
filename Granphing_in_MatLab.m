function Granphing_in_MatLab

%-------------Introduction to MatLab-------------

%Graphing 2D Curves
%Graphing 3D Surfaces
%Graphing Solutions to Systems of Inequalities
%Colormaps in MatLab
%Placing Labels on Graphs

%------------------------------------------------


close all; %Including the pass execution
clc;% Clear all consult commands in the command window



% 2D Graphing-------------

x = -2:.01:2; %vector "x" What it does here is creating a vector whose minimum value is -2 and have numbers from -2 to 2 in spaces of 0.01
y = sin(1./x).*exp(-x.^2);% "./" ".*" ".^" are element wise mulplications/divisions. Similar to the .*
figure(1);
plot(x,y,"b-"); % "b." is discrete point, while "b-" is continuos.
title("Graph of $f(x) = sin(\frac{1}{x})e^{-x^2}$", "interpreter", "latex"); %"interpreter" tells MatLab to use Latex by typing "latex" after the "interpreter"

%% 

% 3D Graphing--------------

xx = -10:0.1:10;%mesh grid cross product btw these 2 vectors to get a rectangular grid.
yy = -10:.1:10;
[X, Y] = meshgrid(xx, yy); %MESH GRID function: create 2 dimentional vectors x and y and return 2d vectors via mesh grid function with xx and yy

Z = X.^2 - Y.^2 - 10*sin(X.*Y) + 1./(X.*Y); %define the function for z for which we want to plot in terms of its surface in 3d

figure(2);
surf(X, Y, Z);%surf command. Hyperbolic 3d surf
title("Surface of $f(x,y)= x^2 - y^2 - 10sin(xy) + \frac{1}{xy}$","Interpreter","latex")

% Graphing feasible regions of 2D linear programs
R = -1:.01:10;
[X, Y] = meshgrid(R, R);

c1 = 3*X + 6*Y < 37; %constrain 1
c2 = 5*X + 5*Y < 42;
c3 = X >= 0;
c4 = Y >= 0;

F = zeros(length(R)); % Define F to be our feasible region and define/initialize the space in our memory to be a vector of lengths R with a bunch of zeros in it. We have a 2d matrix full of zeros
F(~(c1 & c2 & c3 & c4)) = 1;% We want to color all the values in F a different if they satisfy all four
% of these constraints. You can set it =1 or not 0 etc. This is our feasible region
figure(3);

imagesc(F, "xdata", R, "ydata", R);% In some sense this matrix F is a image, so we want to do is to plot that
% image is a function called sc. And then I want to put the x data/ or data
% on x axis
grid on;
axis on;
%image here, we can see the y axis is up side down by sort of convention so
%we want it to be the normal y direction

set(gca, "YDir", "normal");%Make the grah in normal y direction
colormap("parula");%Color map

%We want to label those four little corner points in that particular. First
%we need to find where they are.
px = [0, 8.4, 0, 4.467];
py = [0, 0, 6.167, 3.933];

plab = ["A", "B", "C", "D"];%get labels to them 

hold on;% if we don't use hold on, it's going to delete whatever things were in that figure before, so it's going to overwrite it.

plot(px, py, "bo", "markerfacecolor", "black");
text(px, py, plab, ...
    "VerticalAlignment", "bottom", "HorizontalAlignment", "right");

end