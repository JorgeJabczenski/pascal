program eqLinearesComMatriz;
const
    MAX = 100;
type
    t_matriz = array[0..MAX, 0..MAX] of real;
    t_vetor  = array[0..MAX] of real; 

procedure imprimir_matriz(m : t_matriz; tam : integer);
var 
    i,j : integer;
begin
    for i := 1 to tam do
    begin
        for j := 1 to tam do 
        begin
            write(m[i][j]:0:2,' ');
        end;
        writeln;
    end; 
    writeln;
    writeln ;
end;

function calcular_determinante(m : t_matriz; res : t_vetor; qual,tam : integer) : real;
var 
    i,j,k,v : integer;
    aux : real;
    vetAux : t_vetor;
begin
    calcular_determinante := 1;

    {Botar os resultados no lugar certo pra calcular o determinante}
    for i := 1 to tam do 
        m[i][qual] := res[i];
   // imprimir_matriz(m,tam);

    {Escalonamento}
    for i := 1 to tam-1 do 
    begin
        for j := i+1 to tam do 
        begin
            if m[i][i] = 0 then
            begin
                for v := 1 to tam do 
                    vetAux[v] := m[i][v];
                for v := 1 to tam do 
                    m[i][v] := m[i+1][v];
                for v := 1 to tam do 
                    m[i+1][v] := -vetAux[v];
            end;

            aux := - m[j][i] / m[i][i];
            for k := 1 to tam do 
            begin
                m[j][k] :=  m[j][k] + (aux * m[i][k]);
            end;
               // imprimir_matriz(m,tam);
        end;
    end;

    //writeln('Matriz Escalonada : ');
    //imprimir_matriz(m,tam);

    {Cálculo do Determinante}
    for i := 1 to tam do 
        calcular_determinante := calcular_determinante * m[i][i];

    calcular_determinante := round(calcular_determinante);
   // writeln('Determinante Calculado : ', calcular_determinante);


end;

procedure ler_resultados(var r : t_vetor; t : integer);
var i : integer;
begin
    for i := 1 to t do 
        read(r[i]);
end;

procedure ler_matriz(var m : t_matriz; tam : integer);
var 
    i,j : integer;
begin
    for i := 1 to tam do
        for j := 1 to tam do 
            read(m[i][j]);
end;

function resultados_iguais(vA, vB : t_vetor; t : integer) : boolean;
var i : integer;
begin
    resultados_iguais := true;
    for i := 1 to t do 
        if vA[i] <> vB[i] then resultados_iguais := false;
end;

var 
    matriz : t_matriz;
    resultadoDado, resultadoCalculado, ladoDireito, determinantes : t_vetor;
    linhas, colunas, i : integer;
    

{ > Programa Principal < }
begin

    read(linhas, colunas);
    ler_resultados(resultadoDado,linhas);
    ler_matriz(matriz,linhas);
    ler_resultados(ladoDireito,linhas);

    for i := 0 to linhas do 
    begin
        determinantes[i+1] := calcular_determinante(matriz,ladoDireito,i,linhas);
    end;

    for i := 1 to linhas do 
    begin
        resultadoCalculado[i] := determinantes[i+1] / determinantes[1];
    end;

    if (resultados_iguais(resultadoDado,resultadoCalculado,linhas)) then writeln('sim') else writeln('nao');
end.