program q2;
const 
    MAX = 100;
type
    vetor = array[1..MAX] of integer;

var
    entrada, ocorrencias : vetor;
    tamanho : integer;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
function lerVetorAteZero(var v : vetor):integer;
var num : integer;
begin
    lerVetorAteZero := 0;
    read(num);
    while num <> 0 do 
    begin
        lerVetorAteZero := lerVetorAteZero+1;
        v[lerVetorAteZero] := num;
        read(num);
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure zeraVetor(var v : vetor; t : integer);
var i : integer;
begin
    for i := 1 to t do v[i] := 1;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure imprimeResultado(vet,ocur : vetor;tamanho : integer);
var i : integer;
begin
    for i := 1 to tamanho do 
    writeln (vet[i],' : ',ocur[i],' vezes');
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure shiftVetor(var v : vetor;pos,qntd : integer);
var i : integer;
begin
    for i := 0 to qntd-1 do
        v[pos+i] := v[pos+1+i];
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure achaOcorrencias(var v,o : vetor ; var tamanho : integer);
var i,j : integer;
begin
    i := 1;
    while (i < tamanho) do
    begin
        j := i + 1;
        while(j <= tamanho) do
        begin
            if v[i] = v[j] then
            begin
                o[i] := o[i] + 1;
                shiftVetor(v,j,tamanho-j);
                tamanho := tamanho - 1;   // diminuir o tamanho do vetor
                j := j - 1;  // para checar o novo numero que esta na mesma posicao do que foi shiftado;
            end;
            j := j + 1;
        end; 
        i := i + 1;
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin
    tamanho := lerVetorAteZero(entrada);
    zeraVetor(ocorrencias, tamanho);
    achaOcorrencias(entrada, ocorrencias,tamanho);
    imprimeResultado(entrada, ocorrencias,tamanho);
end.