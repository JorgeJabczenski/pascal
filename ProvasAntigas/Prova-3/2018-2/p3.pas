
{=================================================================================}
{                                ENTRADAS E SAIDAS                                }
{=================================================================================}
{

ENTRADA 1 : 
4
2
12 20 30 0
8 12 2 0
34 70 37 4
112 100 25 12

SAIDA 1 : 
20 30
112 37

ENTRADA 2 : 
4
1
12 20 30 0
8 12 2 0
34 70 37 4
112 100 25 12

SAIDA 2  :
20 30 30
70 70 37
112 100 37

}



{=================================================================================}
{                                  INICIALIZAÇÃO                                  }
{=================================================================================}
program p3;
const  
    MAX = 1024;

type 
    t_matriz = array[1..MAX, 1..MAX] of integer;

{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

procedure ler_matriz(var m :t_matriz; t : integer);
var i,j : integer;
begin
    for i := 1 to t do 
        for j := 1 to t do 
            read(m[i][j]);
end;

{---------------------------------------------------------------------------------}

procedure imprimir_matriz(m : t_matriz; t : integer);
var i, j : integer;
begin
    for i := 1 to t do 
    begin
        for j := 1 to t do 
            write(m[i][j],' ');
        writeln;
    end;
end;

{---------------------------------------------------------------------------------}

function maior2x2(m : t_matriz; x, y : integer) : integer;
var i, j : integer;
begin
    maior2x2 := m[x][y];
    for i := x to x+1 do 
    begin
        for j := y to y+1 do
        begin
            
            //writeln('Comparando ',m[i][j] ,' com ',maior2x2);
            if (maior2x2 < m[i][j]) then 
            begin
                //writeln(m[i][j],' eh maior que ', maior2x2);
                maior2x2 := m[i][j];
            end;
        end;
    end;
end;

{---------------------------------------------------------------------------------}
procedure max_pooling(var m1, m2 : t_matriz; var t1,t2, passo : integer);

var 
    k, l : integer;
begin
    // Calcula o tamanho da matriz pooleada
    if passo = 1 then t2 := t1 - 1 else t2 := t1 div 2;
    //writeln('O tamanho da nova matriz é ',t2,'x',t2);

    for k := 1 to t2 do  
    begin
        for l := 1 to t2 do 
        begin
            if passo = 2 then 
                m2[k][l] := maior2x2(m1, ((k*2)-1),((l*2)-1))
            else 
                m2[k][l] := maior2x2(m1, k,l);
        end;
    end;
end;

{---------------------------------------------------------------------------------}

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}
var 
    passo, tamanho, tamanhopoolada : integer;
    matriz, poolada : t_matriz;

begin
    read(tamanho);
    read(passo);
    ler_matriz(matriz, tamanho); 
    writeln;

    max_pooling(matriz, poolada, tamanho, tamanhopoolada, passo);

    writeln;   
    imprimir_matriz(poolada, tamanhopoolada);

end.