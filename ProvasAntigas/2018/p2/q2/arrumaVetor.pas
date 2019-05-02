program arrumaVetor;
type
    vetor = array[1..100] of integer;
var 
    entrada : vetor;
    tamanho : integer;

procedure imprimeVetor(v : vetor; t : tamanho);
var i : integer;
begin
    for i := 1 to t do write(v[i],' ');
    writeln;
end;

procedure lerVetor(var v : vetor; t : tamanho);
var num, i : integer;
begin
    for i := 1 to t do 
    begin
        read(num);
        v[i] := num;
    end;
end;

procedure shiftaVetor(var v : vetor; indice : integer);
begin 

end;

procedure ajeitaVetor(var v : vetor; t : integer);
var i,j : integer;
begin
    for i := 1 to t do 
    begin
        for j := 1 to t do
        begin
            
        end;
    end;
end;

begin
    read(tamanho);
    lerVetor(entrada, tamanho);
    ajeitaVetor(entrada, tamanho);
    imprimeVetor(entrada, tamanho);
end.