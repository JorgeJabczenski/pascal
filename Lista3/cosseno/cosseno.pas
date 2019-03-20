(*Considere a soma S dos termo da série infinita apresentada abaixo, a qual é responsável pelo cálculo do
valor do co-seno de 1 (um) radiano:

S = 1 - 1/2! + 1/4! - 1/6! + 1/8! - 1/10! + 1/12! - ...

Fazer um programa em linguagem Pascal que seja capaz de calcular o valor aproximado da soma (S) dos
termos da série até o momento em que a diferença das normas (módulo) de 2 termos consecutivos for
menor que 0,000001 (i.e., norma da diferença das normas de dois termos consecutivos).*)

program cosseno;

function fatorial (n : integer) : extended;
var
	fat, i : integer;

begin
	fat := 1;
	for i := 1 to n do
		fat := fat * i;
	fatorial := 1 / fat;

end;



var
	fato, anterior, soma: extended;
	num, i, contador, repetir : integer;

begin
	contador := 0;
	soma := 1;
	num := 2;
	fato := 1;
	anterior := 0.25;
	repetir := 1;


	while (repetir = 1) do
	begin

		fato := fatorial(num);
		writeln;
		writeln('Fatorial de 1/',num,' : ',fato:0:15);
		writeln ('Diferenca : ',fato - anterior:0:6);
		writeln ('Contador : ',contador);
		writeln;

		if abs(fato - anterior) > 0.000001 then
		begin

			if odd(contador) then
				soma := soma + fato
			else
				soma := soma - fato; 
		end
		else 
			break;

		anterior := fato;
		contador := contador + 1;
		num := num + 2;

	end; // end while
	writeln(soma:0:15);
end. // end 
