program trianguloDePascalCom1Vetor;

type 
	vetor = array[1..500] of longint;

var
	triangulo : vetor;
	n,i,j,repeticoes: longint;

function fatorial(num : longint):longint;
begin
	writeln('ENTREI NO FATORIAL');
	fatorial := 1;
	if num <> 0 then 
	begin

		for num := num downto 1 do
		begin
			fatorial := fatorial * num;
		end;
	end;
end;

function calculaCombinacao(l, c : longint) : longint;
begin
	writeln('ENTREI NO CALCULA COMBINACAO');

	calculaCombinacao := fatorial(l) div (fatorial(c)*(fatorial(l-c)));

end; 


begin
	read(n);
	repeticoes := (n*n + n) div 2;
	writeln('LI O NUMERO');

	
	for i:= 0 to repeticoes do 
	begin
	
		writeln('ENTREI NO FOR');
		triangulo[i+1] := calculaCombinacao((i div n), (i mod n));
		write(triangulo[i],' ');

		if (i div n) = 0 then writeln;

		//writeln(fatorial(i));
	end;
	


end.