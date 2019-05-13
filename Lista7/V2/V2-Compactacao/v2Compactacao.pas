program v2compactacao;
const 
	Max = 100;
type
	vetor = array[1..Max] of integer;
var
	original, compactado : vetor;
	tamanho_original, tamanho_compactado : integer;

procedure lerVetor(var v : vetor; t : integer);
var i : integer;
begin
	for i := 1 to t do
		read(v[i]);
end;
________________________________________________________________________________
procedure imprimirVetor(v : vetor; t : integer);
var i : integer;
begin
	for i := 1 to t-1 do write(v[i],' ');
	writeln(v[t]);
end;
________________________________________________________________________________

procedure compactarVetor(original, compactado: vetor; t_original, t_compactado: integer);
var
	ioriginal, icompactado : integer
begin
		
end;
________________________________________________________________________________
begin
	write('Insira o tamanho do vetor que deseja compactar: ');
	readln(tamanho_original));
	writeln('Insira o vetor');
	lerVetor(original, tamanho_original);
	compactarVetor(original, compactado, tamanho_original, tamanho_compactado);
	imprimirVetor(compactado, tamanho_compactado);
end.
