function Picture_Processing
close all; clc;

A = imread("carina_nircam_final-1280.jpg");
[M, N, Z] = size(A);%R G B size? 
figure(1); image(A);
    title(["Original Image, Size = " num2str(M) "，" num2str(N)])

R = A(:, :, 1);
G = A(:, :, 2);
B = A(:, :, 3);

figure(2); imshow(R); colorbar;
title(["red layer, P(x > 200) = " num2str(sum(sum(R > 200))/(M*N))])
colormap([0, 0, 0; 0.25, 0, 0; 0.5, 0, 0; 0.75, 0, 0; 1, 0, 0]);


figure(3); imshow(G); colorbar;
title(["Green Layer, P(x > 200) = " num2str(sum(sum(G > 200))/(M*N))])
colormap([0, 0, 0; 0, 0.25, 0; 0.5, 0, 0; 0, 0.75, 0; 0, 1, 0]);

figure(4); imshow(G); colorbar;
title(["Green Layer, P(x > 200) = " num2str(sum(sum(G > 200))/(M*N))])
colormap([0, 0, 0; 0, 0.25, 0; 0.5, 0, 0; 0, 0.75, 0; 0, 1, 0]);

% Histograms
figure(5); h = imhist(R, 50); %50= number of categories you partition [0. 225]


%Convert ot Grayscale(isomorphism/homomorphism?)
Ag1 = 0.333*R + 0.333*G + 0.333*B;
figure(6); imshow(Ag1); title("Grayscale Image");

Ag2 = rgb2gray(A);
% 0.299*R + 0.587*G + 0.114*B
figure(7); imshowpair(Ag1 , Ag2, "montage");

norm(double(Ag1 - Ag2), 2);

Ag = Ag2;
Dx = [1,2,1; 0, 0, 0; -1, -2, -1];
Dy = Dx';

Agx = conv2(Ag, Dx);
Agy = conv2(Ag, Dy);

Agxx = conv2(Agx, Dx);
Agyy = conv2(Agy, Dy);

AgL = 1- (sqrt(Agxx + Agyy));
figure(8); imshow(AgL); title("Laplacian of the Image");
figure(6)

end
