n = 10;
A = randn(n);
%% 
A_c = crout(A);
L = tril(A_c);
U = triu(A_c, 1) + eye(n);

norm(A - L*U)

%% 
A_ch = A * A';

A_chol = cholesky(A_ch);
L = tril(A_chol);
L_t = L';

norm(A_ch - L*L_t)

%%
U = triu(A);
U_inv = uinv(U);
norm(U*U_inv - eye(n))

%%
A_inv = inv_gpp(A);

norm(A*A_inv - eye(n))