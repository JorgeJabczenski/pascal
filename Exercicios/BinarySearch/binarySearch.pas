program BinarySearch;
const
	MAX = 100;
	MAX_NUM_ALEATORIO = 1000;
type
	vetor = array[1..MAX] of integer;
var
	dados  : vetor;
	num : integer;

procedure gerarVetor(var v : vetor);
var
	i : integer;
begin
	randomize;
	for i := 1 to MAX do
		v[i] := random(MAX_NUM_ALEATORIO)+1;
end;

function binarySearch(v: vetor; num : integer) : boolean;
var
	comeco, fim, meio : integer;
begin
	binarySearch := false;
	comeco := 1;
	meio := MAX div 2;
	fim := MAX;

	while ((fim - comeco) >= 2) and not binarySearch do
	begin
		writeln('Inicio : ',v[comeco],' - ',comeco);
		writeln('Meio :',v[meio],' - ',meio);
		writeln('Fim :',v[fim],' - ',fim);
		writeln;

		if (num = v[meio]) or (num = v[comeco]) or (num = v[fim]) then 
		begin
			writeln('ACHEI NA POSICAO ',meio);
			binarySearch := true;
		end 
		else if num > v[meio] then
		begin
			comeco := meio;
			meio := (comeco + fim) div 2;
		end
		else if num < v[meio] then
		begin
			fim := meio;
			meio := (comeco + fim) div 2;
		end;
	end;

end;

procedure selectionSort(var v : vetor);
var 
    i,j, indiceMenor : integer;
    menor : integer;
begin
    for i := 1 to MAX-1 do
    begin
        menor := v[i];
        indiceMenor := i;
        for j := i+1 to MAX  do 
        begin
            if v[j] < menor then
            begin
                menor := v[j];
                indiceMenor := j;
            end;
        end;
        if indiceMenor <> i then 
		begin
			v[i] := v[i] + v[indiceMenor];
			v[indiceMenor] := v[i] - v[indiceMenor];
			v[i] := v[i] - v[indiceMenor];
		end;
    end;
end;


begin
	
	gerarVetor(dados);
	selectionSort(dados);
	
	for num := 1 to MAX do write(dados[num], ' ');
	writeln;

	while num <> 0 do
	begin
		write('Insira um numero para procurar no vetor que seja diff de zero : ');
		readln(num);
		if num <> 0 then if binarySearch(dados,num) then writeln('ACHEI!') else writeln('Nao encontrado');
	end;
end.
