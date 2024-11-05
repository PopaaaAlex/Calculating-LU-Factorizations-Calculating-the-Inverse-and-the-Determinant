function [A, p] = gpp(A)
%%% Eliminare Gaussian? cu pivotare par?ial?
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice superior triunghiular? cu multiplicatorii gaussieni
%        în triunghiul inferior de dimensiune (n,n)
%   p -- vectorul de permut?ri la nivel de linie

%% SOLUTION START %%
n = size(A,1);
p = zeros(n-1,1);
for k = 1: (n-1)
    maxi = A(k,k);
    poz = k;
    for i = k : n
        if(A(i,k) > maxi)
            maxi = A(i,k);
            poz = i;
        end
    end
    p(k) = poz;
    for j = k:n
        temp = A(poz,j);
        A(poz,j) = A(k,j);
        A(k,j) = temp;
    end
    % aici incepe g
    for i = (k+1):n
        A(i,k) = A(i,k)/A(k,k);
    end
    for i = (k+1):n
        for j = (k+1):n
            A(i,j) =  A(i,j) - A(i,k) * A(k,j);
        end
    end
end

%% SOLUTION END %%