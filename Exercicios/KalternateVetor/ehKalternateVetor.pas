program KalternateVetor;
type
    vetor = array[1..100] of integer;
var 
    entrada : vetor;
    k, tamanho : integer;

function lerVetor(var v : vetor) : integer;
var num : integer;
begin
    lerVetor := 0;
    read(num);
    while(num <> 0) do 
    begin
        lerVetor := lerVetor + 1;
        v[lerVetor] := num;
        read(num);
    end;
end;

function ehKalternate (v : vetor; k, tamanho : integer) : boolean;
var resto : boolean; i : integer;
begin
    i := 1;
    ehKalternate := true;
    resto := odd(v[i]);

    for i := 2 to tamanho do 
    begin
        if (i mod k) = 1 then resto := not resto;
        if (odd(v[i]) <> resto) then ehKalternate := false;
    end; 
end;

begin
    writeln('INSIRA O K');
    read(k);
    writeln('INSIRA UM VETOR TERMINADO EM ZERO');
    tamanho := lerVetor(entrada);
    if ehKalternate(entrada, k, tamanho) then
        writeln('SIM EH KALTERNATE')
    else
        writeln('NAO EH KALTERNATE');
end.