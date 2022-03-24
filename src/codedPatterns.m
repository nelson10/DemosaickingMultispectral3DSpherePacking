function [G] = codedPatterns(N,NF,code)
if(code == 0)
    %% Load SOTA Random Coded Aperture
    if(NF == N)
        x = 1:NF;
        x = x(randperm(length(x)));
        A(1,:) = x;
        for i=2:NF
            temp = x(2:end);
            A(i,1:end-1) = temp;
            A(i,end) = x(1);
            x = A(i,:);
        end
        A = A(x,:);
        G = A;
    else
        x = 1:NF;
        x = x(randperm(length(x)));
        A(1,:) = x;
        for i=2:NF
            temp = x(2:end);
            A(i,1:end-1) = temp;
            A(i,end) = x(1);
            x = A(i,:);
        end
        A = A(x,:);
        r = ceil(N/NF);
        B = ones(r,r);
        G = kron(B,A);
        G = G(1:N,1:N);
    end
elseif(NF<=16 && code == 1)
    %% BTES(5-16)
    if(NF ==5)
        A = [1 5 2 5;4 3 4 3;2 5 1 5;4 3 4 3]; % BTES5
    elseif(NF ==6)
        A = [1 5 2 5;6 3 6 4;2 5 1 5;6 4 6 3]; % BTES6
    elseif(NF ==7)
        A = [1 7 2 7;5 3 6 4;2 7 1 7; 6 4 5 3]; % BTES7
    elseif(NF ==8)
        A = [1 7 2 8;5 3 6 4;2 8 1 7;6 4 5 3]; % BTES8
    elseif(NF ==9)
        A = [1 8 3 9;6 4 7 5;3 9 2 8; 7 5 6 4]; % BTES9
    elseif(NF ==10)
        A = [1 9 4 10;7 5 8 6;3 10 2 9;8 6 7 5]; % BTES10
    elseif(NF ==11)
        A = [1 10 4 11;8 5 9 7;3 11 2 10;9 7 8 6]; % BTES11
    elseif(NF ==12)
        A = [1 11 4 12;9 5 10 7;3 12 2 11;10 8 9 6]; % BTES12
    elseif(NF ==13)
        A = [1 12 4 13;9 5 11 7;3 13 2 12;11 8 10 6]; % BTES13
    elseif(NF ==14)
        A = [1 13 4 14;9 5 11 7;3 14 2 13;12 8 10 6]; % BTES14
    elseif(NF ==15)
        A = [1 13 4 15;9 5 11 7;3 15 2 14;12 8 10 6]; % BTES15
    elseif(NF == 16)
        A = [1,13,4,15;9,5,11,7;3,16,2,14;12,8,10,6]; % BTES16
    end
    B = ones(N/4,N/4);
    G = kron(B,A);
elseif(code == 2)
    %% % Brauers, Johannes, and Til Aach. "A color filter array based multispectral camera." 12. Workshop Farbbildverarbeitung. Ilmenau, 2006.
    %     mk = zeros(N,N,NF);
    %     for k=1:NF
    %         for x=1:N
    %             for y=1:N
    %                 mk(x,y,k) = (k-1 == (mod(x-1,4) + 4*(mod(y-1,4)))).*k;
    %             end
    %         end
    %     end
    x = ones(1,N)';
    y = (1:N)';
    I = kron(x',y);
    J = kron(x,y');
    G = zeros(N,N);
    NF2 = floor(sqrt(NF));
    for k=1:NF
        G = G + (k-1 == (mod(I-1,NF2) + NF2*(mod(J-1,NF2)))).*k;
    end
    %imagesc(G==1)
    %G=sum(mk,3);
    %imagesc(G-mk1)
elseif(code == 3)
    A = [1,2,3,4;5,6,7,8;9,10,11,12;13,14,15,16]; % Sequencial
    B = ones(N/4,N/4);
    G = kron(B,A);
elseif(code == 4)
    A = zeros(NF,NF);
    for i=1:NF
        A(i,:) = circshift(1:NF,i-1); % Uniform
    end
    B = ones(N/NF,N/NF);
    G = kron(B,A);
elseif(code == 5)
    A = [7,8,6,5;15,16,14,13;11,12,10,9;3,4,2,1]; % IMEC
    B = ones(N/4,N/4);
    G = kron(B,A);
end
