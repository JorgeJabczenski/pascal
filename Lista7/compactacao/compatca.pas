program compacta;

const
	MAX = 100;

type
	vetorInt = array[1..MAX] of longint;

var
	entrada : vetorInt;
	tam,i : longint;

procedure lerVetor(quantidade:longint; var v :vetorInt);
var
	indice, num:longint;

begin
write('O: ');

for indice := 1 to quantidade do 
begin
	read(num);
	v[indice]:= num;
	write(num, ' ');
end; //end for 
writeln;

end; //end procedure lerVetor

procedure compactaVetor(quantidade : longint; var v : vetorInt);
var 
	aux : vetorInt;
	i,j,ia : integer;
	repetido : boolean;

begin
	ia := 0;
	for i:= 1 to quantidade do
	begin
		repetido := false; j := i+1;
		while(j <= quantidade) and (not repetido) do
		begin
			if v[i] = v[j] then 
			begin
				repetido := true;
			end; // end if
			j := j +1; 
		end; // end while

		if not repetido then 
		begin
			ia := ia + 1;
			aux[ia] := v[i];
			//writeln ('AQUI O : IA = ',ia,' E AUX[IA] = ',aux[ia]);
		end;
	end; // end for i 

	write('C: ');
	for i := 1 to ia do
	begin
		v[i] := aux[i];
		write(v[i],' ');
	end;
	writeln;
end; // end compactaVetor


begin
	read(tam);
	while(tam <> 0) do 
	begin
		lerVetor(tam, entrada);
		compactaVetor(tam,entrada);
		read(tam);
	end; // end while

end.