program BinarySort;

const
    MAX = 30;
    maiorNumeroAleatorio = 90;
    numerosParaAchar = 5;

type
    vetor = array[1..MAX] of longint;

var 
    dados, procurados : vetor;

procedure swap(var a,b : longint);
var 
    aux : longint;
begin
    aux := a;
    a := b;
    b := aux;
end;

procedure imprimirVetor(v : vetor);
var i : longint;
begin
    for i := 1 to MAX do write(v[i],' ');
    writeln;
end;

procedure imprimirVetorProcurados(v : vetor);
var i : longint;
begin
    for i := 1 to numerosParaAchar do write(v[i],' ');
    writeln;
end;

procedure gerarVetorAleatorio(var v : vetor);
var
    i : longint;
begin
    for i:=0 to MAX do 
        v[i] := random(maiorNumeroAleatorio);
end;

procedure gerarVetorAleatorioBusca(var v : vetor);
var
    i : longint;
begin
    for i:=0 to numerosParaAchar do 
        v[i] := random(maiorNumeroAleatorio);
end;

procedure bubbleSort(var v : vetor);
var 
    i,j : longint;
    executado : boolean;
begin
    for i:= 1 to MAX-1 do 
    begin
        executado := false;
        for j := 1 to MAX-i do 
        begin
            if v[j] > v[j+1] then
            begin
                swap(v[j],v[j+1]);
                executado := true;
            end;
        end;
        if not executado then break;
    end;
end;

procedure binarySearch(v : vetor);
begin
    
end;

procedure normalSearch(v,p : vetor);
var i,j,c : longint;
begin
    c := 0;
    i := 1;

    while(c < numerosParaAchar) and (i <= MAX) do 
    begin 
        j := 1;
        while(c < numerosParaAchar) and (j <= numerosParaAchar) do
        begin
            //writeln ('Comparando ',v[i],' com ',p[j]);
            if v[i] = p[j] then c := c+1;
            j := j+1;
        end;
        i := i+1;
    end;


    writeln('NUMEROS ACHADOS : ',c);
end;

begin
    randomize;
    gerarVetorAleatorio(dados);
    imprimirVetor(dados);
    bubbleSort(dados);
    imprimirVetor(dados);

    gerarVetorAleatorioBusca(procurados);
    imprimirVetorProcurados(procurados);

    normalSearch(dados, procurados);
    //binarySearch(dados, procurados);
end.

