function [A] = inv_gpp(A)
%%% Inversarea unei matrici utilizand eliminarea gaussiana cu pivotare
%%% partiala
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice de dimensiune (n,n) 

%% SOLUTION START %%
n = size(A,1);
[A,p] = gpp(A);
miu = zeros(n,1);

A = uinv(A);

for k = n-1: -1:1
    for i = k+1:n
        miu(i) = A(i,k);
    end
    for i =1:k
        A(i,k) = A(i,k) - A(i,k+1:n)*miu(k+1:n);
    end
    for i = k+1 : n
        A(i,k) = - (A(i,k+1:n)*miu(k+1:n));
    end
    if p(k) ~= k
        for i = 1:n
            temp = A(i,k);
            A(i,k) = A(i,p(k));
            A(i,p(k)) = temp;
        end
    end
end



%% SOLUTION END %%
end