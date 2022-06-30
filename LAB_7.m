%% *INSTITUTO TECNOLÓGICO DE AERONÁUTICA*
%% *CCI-22 - Professor Victor Curtis*
%% *Pedro Luchiari de Carvalho - Turma 4*
%% *Relatório 7 - Integração*
%% *Questão 1 - Regra do Trapézio*

%a) Cálculo para 1 segmento
I(0,1,1)
% Erro para 1 segmento
abs(I(0,1,1)-(g(1)-g(0)))
g(1)-g(0)

%b) Cálculo para 4 segmentos
I(0,1,4)
% Erro para 4 segmentos
abs(I(0,1,4)-(g(1)-g(0)))

%c) Cálculo para 10 segmentos
I(0,1,10)
% Erro para 4 segmentos
abs(I(0,1,10)-(g(1)-g(0)))
%% *Questão 2 - Regra 1/3 de Simpson*

%a) Cálculo para 1 segmento
In(0,1,1)
% Erro para 1 segmento
abs(In(0,1,1)-(g(1)-g(0)))

%b) Cálculo para 4 segmentos
In(0,1,4)
% Erro para 4 segmentos
abs(In(0,1,4)-(g(1)-g(0)))

%c) Cálculo para 10 segmentos
In(0,1,10)
% Erro para 4 segmentos
abs(In(0,1,10)-(g(1)-g(0)))
%% *Questão 3 - Regra 3/8 de Simpson*

%a) Cálculo para 1 segmento
% Nesse caso, como só possuímos dois pontos, a regra de 3/8 de Simpson não
% tem grandes vantagens e obtemos:
(1-0)*(f(0)+f(1))/8
%Com um erro:
abs((1-0)*(f(0)+f(1))/8-(g(1)-g(0)))

%b)1/3 de Simpson + 3/8 de Simpson (5 segmentos):
%Cálculo da integral de 0 a 0.4 (com 1/3 de Simpson):
i1 = 0.4*(f(0)+4*f(0.2)+f(0.4))/6;
%Cálculo da integral de 0.4 a 1 (com 3/8 de Simpson):
i2 = 0.6*(f(0.4)+3*(f(0.6)+f(0.8))+f(1))/8;
%Soma das duas partes:
i = i1+i2
%Cálculo de erro:
abs(i-(g(1)-g(0)))
%% Funções Utilizadas:

function i = I(a, b, n)
    sum=0;
    for j=1:n-1
        sum = sum + f(a+j*(b-a)/n);
    end
    i = (b-a)/(2*n)*(f(a)+2*sum+f(b));
end

function i = g(x)
    i = 2*x + 2.5*x^2 - x^3 + 1.5*x^4 - 7/5*x^5 - 0.5*x^6 + 1/7*x^7;
end

function d = f(x)
    d = 2 + 5*x - 3*x^2 + 6*x^3 - 7*x^4 - 3*x^5 + x^6;
end

function i = In(a, b, n)
    sumodd=0;
    k=0;
    while 2*k+1 < n
        sumodd = sumodd + f(a+(2*k+1)*(b-a)/n);
        k=k+1;
    end
    sumeven=0;
    j=1;
    while 2*j < n
        sumeven = sumeven + f(a+2*j*(b-a)/n);
        j=j+1;
    end
    i= (b-a)/(3*n)*(f(a)+4*sumodd+2*sumeven+f(b));
end