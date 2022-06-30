%% *INSTITUTO TECNOL�GICO DE AERON�UTICA* 
%% *CCI-22 - Professor Victor Curtis* 
%% *Pedro Luchiari de Carvalho - Turma 4* 
%% *Relat�rio 5 - Interpola��o (parte 2)*
%% Quest�o 1 

%c�lculo dos n�s de Chebyshev:
n=2;
a=-3;
b=3;
for i = 0 : n
    xc(i+1) = cos(pi*i/n);
end

for i = 0:n
    x(i+1) = (a+b)*0.5 - (b-a)*0.5*xc(i+1);
end

fprintf('nos de Chebyshev:')
for i=1:n+1
    fprintf('x%d = %.5f.\n',i-1, x(1,i));
end

%Agora vem a interpola��o (usaremos a fun��o polyfit). O output ser�o os coeficientes 
% do nosso polin�mio, que ser�o usados na subsequente plotagem:
y = arrayfun(@(x) f(x), x);
l = linspace(-3,3);
p = polyfit(x, y, n);

fplot(@(l) polyval(p, l), [-3, 3])
hold on
fplot(@(l) f(l), [-3, 3])
grid on
title('Interpola��o para grau 2')
xlabel('x');
ylabel('y');
legend('p(x)', 'f(x)');

maxerror = 0;
for i = 1:100
    if polyval(p, l(i))-f(l(i)) > maxerror
       maxerror = polyval(p, l(i))-f(l(i));
    end
end

display (maxerror);

%Agora, aplicaremos o mesmo para n = 3 : 10

for i = 3:10
    for j = 0:i
        xc(j+1) = cos(pi*j/i);
    end
    for j = 0:i
        x(j+1) = (a+b)*0.5 - (b-a)*0.5*xc(j+1);
    end
    fprintf('nos de Chebyshev para n = %d:', i)
    for i=1:n+1
        fprintf('x%d = %.5f.\n',i-1, x(1,i));
    end
    y = arrayfun(@(x) f(x), x);
    p = polyfit(x, y, i);
    fplot(@(l) polyval(p, l), [-3, 3])
    grid on
    title('Interpola��o para graus de 3 a 10')
    xlabel('x');
    ylabel('y');
    legend('p(x)', 'f(x)');
end
%% 
% Defini��o da fun��o f:

function d = f(x)
    d = 4/(5+2*x^2);
end
%% Quest�o 2