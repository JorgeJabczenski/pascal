program compacta;

const
	MAX = 100;
type
	vetorInt = array[1..MAX] of longint;

var
	entrada : vetorInt;
	tam,i : longint;

procedure shift(var v : vetorInt; var fim,inicio : longint);
var 
	c : longint;
begin
	//writeln('SHIFT!!!');
	//for c := 1 to fim do  write (v[c],' ');
	//writeln;


	for c := inicio to fim do 
	begin
		v[c] := v[c + 1]
	end;
	fim := fim - 1;
	//inicio := inicio -1;

	//for c := 1 to fim do  write (v[c],' ');
	//writeln;
end;


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
	i,j,ia : longint;
	repetido : boolean;

begin
	ia := 0;
	for i:= 1 to quantidade do
	begin
		repetido := false; j := i+1;
		while(j <= quantidade) and (not repetido) do
		begin
			//writeln('Estou comparando',v[i],' com ',v[j]);
			if v[i] = v[j] then 
			begin
				//repetido := true;
				shift(v,quantidade,j);
			end 
			else  
				j := j +1; 
		end; // end while

		if not repetido then 
		begin
			ia := ia + 1;
			aux[ia] := v[i];
		end;
	end; // end for i 

	write('C: ');
	for i := 1 to quantidade do
	begin
		//v[i] := aux[i];
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