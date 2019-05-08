program compactacao;
type
	vetor = array[1..100] of integer;
var
	entrada     : vetor;
	num,tamanho : integer;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure lerVetor(var v : vetor; t : integer);
var i : integer;
begin
	writeln('Entre com seu vetor de tamanho ',t);
	for i := 1 to t do read(v[i]);
	writeln('Terminei de ler o vetor');	
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure imprimirVetor(v : vetor; t : integer);
var i : integer;
begin
	write('Vetor compactado : ');
	for i := 1 to t do write(v[i],' ');
	writeln;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure shiftar(var v : vetor; indice,vezes : integer);
var i : integer;
begin
	for i := 0 to vezes do
		v[indice+i] := v[indice+1+i];
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure compactacao(var  v : vetor; var tamanho : integer);
var i,j : integer;
begin
	i := 1;
	while (i <= tamanho) do
	begin
		j := i+1;
		while(j <= tamanho) do
		begin
			if v[i] = v[j] then
			begin
				shiftar(v,j,tamanho-j);
				tamanho := tamanho - 1;
				j := j-1;		
			end;
			j := j + 1;
		end;
		i := i + 1;
	end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin
	writeln('Entre com o tamanho do vetor');
	read(tamanho);
	lerVetor(entrada, tamanho);
	compactacao(entrada, tamanho);
	imprimirVetor(entrada, tamanho);
end.
