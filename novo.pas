program convert;
type
	vetor10bytes = array[0..10] of byte;

procedure decToBin ();
var 
	numdtb : integer;
	contador, i : byte;
	bits : array[0..10] of byte; 

begin
	writeln('');
	contador:= 0;
	write('Digite um numero p/ a conversao:  ');
	read (numdtb);

	while numdtb > 0 do
	begin
		bits[contador] := numdtb mod 2;
		contador := contador + 1;
		numdtb := numdtb div 2;
	end;
	for i:= contador downto 0 do
		write(bits[i]);
	writeln('');
	writeln('Conversao Encerrada') 
end;

procedure decToHex();

	(*NAO TAO COMPLICADO PRA FAZER AGORA MAS É MUITO TRABALHOSO*) 
begin
end;


procedure binToDec();
var
	bits: array[0..10] of byte;
	entrada: cardinal;
	resultado:extended;
	contador, i: byte;
	r: integer;
	

begin
	contador := 0;
	resultado:= 0;
	write('Digite um numero p/ a conversao:  ');
	read(entrada);

	while entrada > 0 do
	begin
		bits[contador] := entrada mod 10;
		entrada := entrada div 10;
		contador := contador + 1;
	end;

	for i:= 0 to contador-1 do
	begin
		resultado := resultado + exp(i*ln(2)) * bits[i];
		//writeln(bits[i]);
		//writeln('');

	end;
	write('O resultado em decimal eh:  ');
	writeln(Trunc(resultado));
	writeln('');
end;

procedure binToHex();

	(*MUITO COMPLICADO PRA FAZER AGORA*) 
begin
end;

procedure hexToDec();

	(*MUITO COMPLICADO PRA FAZER AGORA*) 
begin
end;

procedure hexToBin();

	(*MUITO COMPLICADO PRA FAZER AGORA*) 
begin
end;


var 
	base, num:integer;
	escolha: byte;
 

begin

	writeln('Escolha de seu conversor:');
	writeln('1 - Dec to Bin (10 bits)');
	writeln('2 - Dec to Hex');
	writeln('3 - Bin to Dec');
	writeln('4 - Bin to Hex');
	writeln('5 - Hex to Dec');
	writeln('6 - Hex to Bin');
	writeln('7 - Dec to Personalizado');

	read(escolha);

	case escolha of
		1: decToBin();

		2: decToHex();

		3: binToDec();

		4: binToHex();

		5: hexToDec();

		6: hexToBin();

		7: begin
			write('Digite um numero p/ a conversao em decimal:  ');
			readln(num);
			write('Digite a base nova:  ');
			read(base);
			while (num/base) > 0 do
			begin
				writeln((num)mod(base));
				num := num div base;
			end;
		end;
	else 
		writeln('Escolha Invalida!');
	end ;

end.
