program q1;
const
	tamanho = 5;
type
	vetor = array[1..tamanho] of integer;
var
	v1,v2 : vetor;
	tam1, tam2, min, max,i : integer;

procedure retornaValores(v1 : vetor;t1 : integer; var v2 : vetor; var t2 : integer; min, max : integer);
var i,j : integer;
begin
	for i:=1 to t1 do 
	begin
		if (v1[i] <=  max) and (v1[i] >= min) then
		begin
			t2 := t2+1;
			v2[t2] := v1[i];
		end;	
	end;
end; 

begin
	writeln('Insira um valor de tam ',tamanho );
	for i := 1 to tamanho do read(v1[i]);
	writeln('Insira o Min e o Max');
	read(min,max);
	retornaValores(v1,tamanho,v2,tam2,min,max);
	for i := 1 to tam2 do write(v2[i],' ');
	writeln;

end.

