program balanceada;

type
    vetor = array[1..100] of integer;

var 
    entrada : vetor;
    tamanho, somaA, somaB, c : integer;
    ehbalanceada : boolean;

procedure lerVetor(var v : vetor; var t : integer);
var num : integer;
begin
    read(num);
    while(num <> 0) do
    begin
        t := t + 1;
        v[t] := num;
        read(num);
    end;
    //writeln('Tamanho do vetor = ', t);
end;

function somaMaiorMenor(var v : vetor; var t : integer) : integer;
var i , iMai, iMen, maior, menor: integer;
begin
    for i := 1 to tamanho do 
        if v[i] <> -1 then
        begin
            maior := v[i];
            menor := v[i];
            iMai := i;
            iMen := i;
            break;
        end;


    for i := 1 to t do 
    begin
        if (v[i] > maior) and (v[i] <> -1) then
        begin 
            maior := v[i];
            iMai := i;
        end;
        if (v[i] < menor) and (v[i] <> -1) then 
        begin
            menor := v[i];
            iMen := i;
        end;
    end;

    //writeln('Menor = ',menor,' no indice ',iMen);
    //writeln('Maior = ',maior,' no indice ',iMai);

    v[iMai] := -1;
    v[iMen] := -1;

    somaMaiorMenor := maior + menor;

end;

procedure imprimirVetor(v:vetor; t:integer);
var i : integer;
begin 
    for i:= 1 to tamanho do write(v[i],' ');
    writeln;
end;

begin
    ehbalanceada := true;

    lerVetor(entrada, tamanho);
    somaA := somaMaiorMenor(entrada, tamanho);
    //writeln('A soma do maior com o menor eh = ', somaA);
    somaB := somaA;

    c := 2;
    while ehbalanceada and (c <= tamanho div 2) do 
    begin
        //imprimirVetor(entrada, tamanho);
        somaB := somaMaiorMenor(entrada, tamanho);
        //writeln(somaA,' ',somaB);
        if somaB <> somaA then ehbalanceada := false;
        c := c + 1;
        writeln;
    end;

    writeln;
    if ehbalanceada then writeln('Sim eh balanceada') else writeln('Nao eh balanceada');
        writeln;

end.