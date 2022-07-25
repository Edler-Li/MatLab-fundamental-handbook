function Linear_Algebra_in_MatLab
close all;
clc;

% Defining Vectors and Matrices
% Norms of Matrices
% Condition Numbers of Matrices
% Dot Products of Vectors
% Solving Linear Systems of Equations
% Determinants, Traces, and Inverses
% Reduced Row Echelon Forms
% Transpositions of Matrices
% Eigenvalues and Eigenvectors
% Combine/Concatenate vectors
% Singular Values and Singular Vectors
% Kronecker Tensor Products of Matrices



% Defining Vectors and Matrices-------------------------
A = [4, 5, 2; 
    8, 7, -2; 
    0, -1, 4];%Row-wise fashion

% Norms of a Matrix/Vector------------------------------
norm(A, 2); %Give you l2 norm, which is commonly used



% Determinants, Traces, and Inverses--------------------
det(A);
trace(A);


% Dot Products of Vectors-------------------------------

v1 = rand(4, 1);% meaning 4 random by 1 vector
v2 = rand(4, 1);
dot(v1, v2);

% Solving Linear Systems of Equations--------------------
% Ex: Ax = b, A is a square matrix(two ways to solve)
b = [5; -2; 1];
det(A);

inv(A)*b % method 1
A\b %More PREFFERED one

% Reduced Row Echelon Forms-------------------------------
rref(A);

B = [4, -3, 6, 7;
    -2, 1, 5, 4];
rref(B)

% Transpositions of Matrices------------------------------
B
transpose(B);
B.' ;


% Eigenvalues and Eigenvectors-----------------------------
[V, D] = eig(A) % V is eigent vector and D(diagonal matrix) is coresponing eigent value
V(:, 1) %All row, column 1
norm(V(:, 1), 2)% Equal to 1, this is acutally a normalized eigenvenctor

% Vectors of ones or zeros---------------------------------
v1s = ones(5, 1); % 5 rows 1 column
v0s = zeros(2, 3);


% Combine/Concatenate vectors togther-----------------------

Xk = rand(5, 7)

X = [v1s, Xk] %Plug v1s vector into matrix Xk------------------


% Singular Value Decomposition and Singular Vectors--------------

%singular value decomposition function return you 3 different items to
%you:2 unitary matrices u and v, and an non-square matrix containing
%singular values of some matrix of interest


[U, S, V] = svd(transpose(X)*X);
 
% Then we want to investigate the stability of a matrix which is associated
% to the condition number 
% Conditionb number--------------
 cond(transpose(X)*X); %Condition number


 B = V*inv(S)*transpose(U)*transpose(X)*rand(5, 1);


 % Selecting subsets of matrices------------------------------------
 C = rand(5, 9);
 Csub = C(2:4 ,:); %pick row 2~4 and all columns


% Kronecker Tensor Products of Matrices-----------------------------
% We can only do dot product to vectors but here we could use Kronecker
% Tensor Products to do between Matrices
A1 = rand(2,2);
B1 = eye(3,3) %Identity matrix
Ka1b1 = kron(A1, B1)
Kb1a1 = kron(B1, A1)




end 