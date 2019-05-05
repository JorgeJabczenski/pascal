program arrumaVetor;
type
    vetor = array[1..100] of integer;
var 
    entrada : vetor;
    tamanho : integer;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure imprimeVetor(v : vetor; t : integer);
var i : integer;
begin
    for i := 1 to t do write(v[i],' ');
    writeln;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure lerVetor(var v : vetor; t : integer);
var num, i : integer;
begin
    for i := 1 to t do 
    begin
        read(num);
        v[i] := num;
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure ordena(var v : vetor; t : integer);
var i,j,a : integer;
begin
    for i := 1 to t do  
        for j := 1 to t-1 do 
            if v[j] > v[j+1] then
           begin
                a      := v[j];
                v[j]   := v[j+1];
                v[j+1] := a;
            end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure shiftar(var v : vetor; indice, vezes : integer);
var 
    i : integer;
begin
    writeln('SHIFTANDO O VETOR...');
    for i := 1 to vezes do 
    begin
        v[indice] := v[indice + 1];
        indice := indice + 1;
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure junta(var v : vetor; aux : vetor; inicio, vezes : integer);
var i : integer;
begin
    writeln('JUNTANDO OS VETORES');
    for i := 1 to vezes do 
    begin
        //writeln('BOTANDO ',aux[i],' NA POSICAO ',inicio);
        v[inicio] := aux[i];
        inicio := inicio + 1;
    end;
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
procedure ajeitaVetor(var v : vetor; t  : integer );
var
    i,j,indiceAux, tam : integer;
    aux : vetor;
begin
    tam := t;
    writeln('AJEITANDO O VETOR...');
    indiceAux := 0;
    for i:= 1 to t do
    begin
        j := i + 1;
        while j <= t  do                    // começa a checar a partir do próximo elemento a direita de v[i]
        begin
            if v[i] = v[j] then             // caso encontre um repetido
            begin
                indiceAux := indiceAux + 1; // incrementa o indice do vetor de repetidos
                aux[indiceAux] := v[i];     // joga o numero repetido em outro vetor para ordena-lo depois
                shiftar(v,j,(t-j));         // retira o elemento v[j] e move o resto do vetor 'pra frente'
                t := t - 1;
                j := j - 1;
            end;
            j := j + 1;
        end;
    end;
    writeln;

    ordena(aux,indiceAux);                      // ordena o veto de repetidos
    junta(v,aux,(tam-indiceAux)+1, indiceAux);  // junta os vetores do jeito certo 
end;
//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
begin
    read(tamanho);
    lerVetor(entrada, tamanho);
    ajeitaVetor(entrada, tamanho);
    imprimeVetor(entrada, tamanho);
end.