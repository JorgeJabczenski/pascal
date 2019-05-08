program subtituicao;

type
	vetor = array[1..100] of integer;
var
	v1,v2,v3 : vetor;
	t1,t2,t3 : integer;
	pos_ini, pos_fim : integer;
	houveTroca  : boolean;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
function lerVetorAteZero(var v : vetor) : integer;
var num : integer;
begin
	lerVetorAteZero := 0;
	read(num);
	while(num <> 0) do
	begin
		lerVetorAteZero := lerVetorAteZero + 1;
		v[lerVetorAteZero] := num;
		read(num);
	end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure imprimeVetor(v : vetor; t : integer);
var i : integer;
begin
	for i := 1 to t do write(v[i],' ');
	writeln;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
function ocorre(v1,v2 : vetor; t1,t2 : integer; var pos_ini, pos_fim : integer): boolean;
var 
	i,j   : integer;
	achou : boolean;
begin
	ocorre := false;
	achou  := false;

	i := 0;
	while (i <= t1-t2+1) and not achou do 
	begin
		ocorre := true;
		for j := 1 to t2 do
			if v1[i+j] <> v2[j] then ocorre := false;		

		if ocorre then 
		begin
			pos_ini := i+1;
			pos_fim := i + t2;
			achou := true;
		end;
		i := i + 1;
	end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure substitui(var v1 :vetor; v3 : vetor; t3,pos_ini: integer);
var i : integer;
begin
	for i := 0 to t3-1 do
	begin
		v1[pos_ini + i] := v3[i+1];
	end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure shiftaVetor(var v1 : vetor;var t1 : integer ;  t2,t3,pos_ini,pos_fim: integer);
var i ,indice: integer;
begin
	if t3 > t2 then
	begin
		indice := t1 + t3 - t2;
		for i := 1 to t1-pos_fim do
		begin
			v1[indice] := v1[indice-(t3-t2)];
			indice := indice - 1;		
		end;
	t1 := t1+(t3-t2);
	end;
	
	if t2 > t3 then
	begin
		indice := pos_ini;
		for i := 1 to t1-pos_fim do
		begin
			v1[indice] := v1[indice+(t2-t3)];
			indice := indice + 1;
		end;
	t1 := t1 - (t2-t3);
	end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin
	houveTroca := false;

	t1 := lerVetorAteZero(v1);
	t2 := lerVetorAteZero(v2);
	t3 := lerVetorAteZero(v3);

	if ocorre(v1,v2,t1,t2,pos_ini,pos_fim) then
	begin
		shiftaVetor(v1,t1,t2,t3,pos_ini,pos_fim);
		substitui  (v1,v3,t3,pos_ini);
		houveTroca := true;
	end;

	if houveTroca then imprimeVetor(v1,t1) else writeln('vazia');

end.
