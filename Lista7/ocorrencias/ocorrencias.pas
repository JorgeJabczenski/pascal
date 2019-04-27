program ocorrencias;

type 
	vetor = array [1..100] of integer;

var
	n,m:integer;
	entradan, entradam : vetor;

procedure lerVetor(var v:vetor; n:integer);
var i,num : integer;
begin
	for i := 1 to n do 
	begin
		read(num);
		v[i] := num;
	end;
end;

function buscaOcorrencia(en,em : vetor; n,m : integer) : integer;
var 
	i,j   : integer;
	igual : boolean;
begin
	buscaOcorrencia := 0;
	for i := 0 to (n-m)+1 do 
	begin
		igual := true;
		
		for j:= 1 to m do 
			if en[i+j] <> em[j] then igual := false;

		if igual then 
			buscaOcorrencia := buscaOcorrencia + 1;

	end;
end;


begin
	read(n,m);
	lerVetor(entradan,n);
	lerVetor(entradam,m);
	writeln(buscaOcorrencia(entradan, entradam,n,m));
end.