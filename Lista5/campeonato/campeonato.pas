program campeonato;

type
    nomes = string[20];

var 
    nzao, indice, maior, indiceMaior, pontuacao : integer;
    x : string[20];
    times : array[1..20] of nomes;

begin
    readln(nzao);
    for indice := 1 to nzao do
    begin
        readln(x);
        times[indice] := x;
    end;

    readln(pontuacao);
    maior := pontuacao;
    indiceMaior := 1;

    for indice := 2 to nzao do
    begin
        readln(pontuacao);
        if (pontuacao > maior) then
        begin
            maior := pontuacao;
            indiceMaior := indice;
        end;
    end;

    writeln('O campeao eh o ',times[indiceMaior]);
    
end.