{=================================================================================}
{                                   ENUNCIADO                                     }
{=================================================================================}
{
Um jogo de palavras cruzadas pode ser representado por uma matriz A(n × m) onde cada posição da matriz corresponde 
a um quadrado do jogo, sendo que 0 indica um quadrado em branco e -1 indica um quadrado preto. Colocar as 
numerações de início de palavras horizontais e/ou verticais nos quadrados correspondentes (substituindo os zeros), 
considerando que uma palavra deve ter pelo menos duas letras.

Exemplo de entrada:
5 8
0 -1 0 -1 -1 0 -1 0
0 0 0 0 -1 0 0 0
0 0 -1 -1 0 0 -1 0
-1 0 0 0 0 -1 0 0
0 0 -1 0 0 0 -1 -1

Saída esperada para a entrada anterior:
1 -1 2 -1 -1 3 -1 4
5 6 0 0 -1 7 0 0
8 0 -1 -1 9 0 -1 0
-1 10 0 11 0 -1 12 0
13 0 -1 14 0 0 -1 -1

> Melhor vizualização 

 1 -1  2 -1 -1  3 -1  4
 5  6  0  0 -1  7  0  0
 8  0 -1 -1  9  0 -1  0
-1 10  0 11  0 -1 12  0
13  0 -1 14  0  0 -1 -1 

}

{=================================================================================}
{                                  INICIALIZAÇÃO                                  }
{=================================================================================}
program palavrascruzadas;
const  
    MAX = 100;
type 
    t_matriz = array[0..MAX,0..MAX] of integer;
    t_tamanho = record
        l,c : integer;
    end;
{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

procedure ler_matriz(var m : t_matriz; var t : t_tamanho);
var i,j : integer;
begin
    read(t.l,t.c);
    for i := 1 to t.l do 
        for j := 1 to t.c do 
            read(m[i][j]);
end;

{---------------------------------------------------------------------------------}

procedure criar_bordas(var m : t_matriz; t : t_tamanho; valor : integer);
var i: integer;
begin
    for i := 0 to t.c + 1 do 
    begin
        m[0][i] := valor;
        m[t.l + 1][i] := valor;
    end;
    for i := 0 to t.l + 1 do 
    begin
        m[i][0] := valor;
        m[i][t.c + 1] := valor;
    end;
end;

{---------------------------------------------------------------------------------}

{ESTA IMPRIMINDO COM AS BORDAS}
procedure imprimir_matriz(m : t_matriz; t : t_tamanho);
var i, j : integer;
begin
    for i := 1 to t.l do 
    begin
        for j := 1 to t.c do 
            write(m[i][j], ' ');
        writeln;    
    end;
end;

{---------------------------------------------------------------------------------}

function eh_palavra (m : t_matriz; i, j : integer) : boolean;
begin
    eh_palavra := false;

    if m[i][j+1] = -1 then
    begin
        if m[i+1][j] = 0 then 
        begin
            if m[i-1][j] = -1 then eh_palavra := true;
        end;
    end;

    if m[i][j+1] = 0 then
    begin
        if m[i][j-1] = -1 then eh_palavra := true
        else if m[i][j-1] = 0 then 
            begin
                if m[i+1][j] = 0 then 
                begin
                    if m[i-1][j] = -1 then eh_palavra := true;
                end;
            end
        else 
            begin
               if m[i+1][j] = 0 then
               begin
                   if m[i-1][j] = -1 then eh_palavra := true; 
               end; 
            end;
    end;

end;

{---------------------------------------------------------------------------------}

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}

var
    matriz  : t_matriz;
    tamanho : t_tamanho;
    contador,i, j : integer;

begin
    contador := 0;
    ler_matriz(matriz, tamanho);
    criar_bordas(matriz,tamanho, -1);

    for i := 1 to tamanho.l do 
        for j := 1 to tamanho.c do
        if matriz[i][j] <> -1 then 
        begin
            if eh_palavra(matriz, i, j) then 
            begin 
                contador := contador + 1;
                matriz[i][j] := contador
            end;
        end;
    
    imprimir_matriz(matriz,tamanho);

end.