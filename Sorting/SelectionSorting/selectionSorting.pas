program selectionSorting;

const
    MAX = 100;

type
    vetor = array[1..MAX] of longint;

var 
    entrada : vetor;
    tamanho : byte;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure lerVetor(var v : vetor; t : byte);
var i : byte; num : longint;
begin
    for i := 1 to t do 
    begin
        read(num);
        v[i] := num;
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure imprimirVetor(var v : vetor; t : byte);
var i : byte;
begin
    for i := 1 to t do 
        write(v[i],' ');
    writeln;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure swap(var a,b : longint);
begin
    a := a + b;
    b := a - b;
    a := a - b;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure selectionSort(var v : vetor; t : byte);
var 
    i,j, indiceMenor : byte;
    menor : longint;
begin
    for i := 1 to t-1 do
    begin
        menor := v[i];
        indiceMenor := i;
        for j := i+1 to t do 
        begin
            if v[j] < menor then
            begin
                menor := v[j];
                indiceMenor := j;
            end;
        end;
        if indiceMenor <> i then swap(v[i],v[indiceMenor]);
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin
    writeln('Entre com um tamanho de vetor menor que 100');
    read(tamanho);
    lerVetor(entrada, tamanho);
    selectionSort(entrada, tamanho);
    imprimirVetor(entrada, tamanho);
end.