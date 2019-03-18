(*Considere a soma S dos termo da série infinita apresentada abaixo, a qual é responsável pelo cálculo do
valor do co-seno de 1 (um) radiano:

S = 1 - 1/2! + 1/4! - 1/6! + 1/8! - 1/10! + 1/12! - ...

Fazer um programa em linguagem Pascal que seja capaz de calcular o valor aproximado da soma (S) dos
termos da série até o momento em que a diferença das normas (módulo) de 2 termos consecutivos for
menor que 0,000001 (i.e., norma da diferença das normas de dois termos consecutivos).*)

program cosseno;

function fatorial (n : integer) : integer;
var
	fat, i : integer;

begin
	fat := 1;
	for i := 1 to n do
		fat := fat * i;

	
	n := fat;

end;



var
	num, fato: integer;

begin
	read(num);
	fato := fatorial(num);
	writeln('Fatorial : ', fato); 
end.