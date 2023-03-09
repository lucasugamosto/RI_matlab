%Luca Sugamosto matricola 0324613

%ALGORITMO DI NEWTON A TEMPO DISCRETO

%inizializzazione dei parametri fondamentali
T = 0.001;                  %tempo di campionamento
nCampioni = 10000;          %numero di campioni di q cappello
lambda = 5;                 %lambda = 1/tau, dove tau = costante di tempo
totalTime = 10;             %tempo massimo di studio
P = 2;                      %valore di riferimento da inseguire

%inizializzo tutti gli elementi del vettore dei campioni a 0 tranne il
%primo che sta ad indicare la condizione iniziale che è pari a 0.001.
q = zeros(1,nCampioni);
q(1) = 0.001;               %valore di giunto q all'istante 0

%algoritmo di Newton a tempo discreto
PCappello = zeros(1,nCampioni);
PCappello(1) = (q(1))^2;    %valore della posizione P all'istante 0

for k = 2:nCampioni
    q(k) = q(k-1) + T*(lambda/2)*(1/(2*q(k-1)))*(P-(q(k-1)^2));
    PCappello(k) = (q(k))^2;
end

for k = 1:nCampioni
    q_riferimento(k) = sqrt(2);
    numCampione(k) = k;
end

figure(1);
plot(numCampione,q,numCampione,q_riferimento);
title('variabile di giunto q');

figure(2);
plot(PCappello);
title('variabile di posizione P');