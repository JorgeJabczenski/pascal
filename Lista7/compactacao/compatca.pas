program compacta;
const
	MAX = 100;
type
	vetorInt = array[1..MAX] of longint;
var
	entrada : vetorInt;
	tam : longint;

procedure shift(var v : vetorInt; var fim,inicio : longint);
var 
	c : longint;
begin
	for c := inicio to fim do 
	begin
		v[c] := v[c + 1]
	end;
	fim := fim - 1; // Diminui o 'tamanho' do vetor, pois todos os 
end;                // bits repetidos foram mudados para uma posição antes


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
	i,j: longint;

begin
	for i:= 1 to quantidade do
	begin
		j := i+1;
		while(j <= quantidade) do
		begin
			if v[i] = v[j] then 
				shift(v,quantidade,j)
			else  
				j := j + 1; 
		end; // end while
	end; // end for i 

	write('C: ');
	for i := 1 to quantidade do
		write(v[i],' ');
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