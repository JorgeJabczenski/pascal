{=================================================================================}
{                                   ENUNCIADO                                     }
{=================================================================================}
{
Seguindo o racíocinio do exercício sobre quadrado mágico. Crie um programa em 
Free Pascal que leia um inteiro n que representa o tamanho do lado de uma matriz 
A e uma matriz A(n x n) que representa o quadrado e imprima quantas matrizes não 
triviais (isto é, não pode ser a matriz que é constituida por apenas um elemento, 
uma linha e uma coluna) formam um quadrado mágico a partir da matriz fornecida.

Exemplo de entrada:
6
2 7 6 6 7 2
9 5 1 1 5 9
4 3 8 8 3 4
4 9 2 2 9 4
3 5 7 7 5 3
8 1 6 6 1 8

Saída esperada para a entrada acima:
5
}

program qm2;

const  
    MAX = 100;

type 
    t_matriz = array[1..MAX,1..MAX] of integer;

{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

procedure ler_matriz(var m : t_matriz; var t : integer);
var i,j : integer;
begin
    read(t);
    for i := 1 to t do 
        for j := 1 to t do 
            read(m[i][j]);
end;
{---------------------------------------------------------------------------------}

procedure imprimir_matriz(m : t_matriz ; t : integer);
var i,j : integer;
begin
    for i := 1 to t do
    begin
        for j := 1 to t do 
            write(m[i][j],' ');
        writeln;
    end;
end;

{---------------------------------------------------------------------------------}

procedure copia_matriz_quadrada(var m1,m2 : t_matriz; x,y,t : integer);
var
    i, j : integer;
begin
    for i := 1 to t do 
        for j := 1 to t do 
            m2[i][j] := m1[i+(x-1)][j+(y-1)];
end;

{---------------------------------------------------------------------------------}

function eh_magico(m : t_matriz; t : integer) : boolean;
var 
    i,j : integer;
    somaAnterior, somaAtual : integer;
begin
    eh_magico := true;
    somaAnterior := 0;
    somaAtual := 0;

    //writeln('Analisando a Matriz : ');
    //imprimir_matriz(m,t);
    //writeln;

    {Verifica as Linhas}
    for i := 1 to t do 
    begin
        for j := 1 to t do 
        begin
            somaAtual :=  somaAtual +  m[i][j];
        end;
        //writeln('Soma   =  ',somaAtual);
        
        if i = 1 then
            somaAnterior := somaAtual
        else 
            if somaAnterior <> somaAtual then 
                eh_magico :=  false; 

        somaAtual := 0;
    end;

    {Verifica as Colunas}
    for i := 1 to t do 
    begin
        for j := 1 to t do 
        begin
            somaAtual :=  somaAtual +  m[j][i];
        end;
        //writeln('Soma   =  ',somaAtual);
        if i = 1 then
            somaAnterior := somaAtual
        else 
            if somaAnterior <> somaAtual then 
                eh_magico :=  false; 
        
        somaAtual := 0;
    end;

    //if eh_magico then writeln('eh magico ') else writeln ('nao eh magico');

end;

{---------------------------------------------------------------------------------}

function qntd_magicos(m : t_matriz; t1,t2 : integer) : integer;
var 
    i,j : integer; 
    quadradoAux : t_matriz;
    
begin
    qntd_magicos := 0;

    //LOOP MAIOR

    for i := 1 to (t1 - (t2 -1)) do 
    begin
        for j := 1 to (t1 - (t2 -1)) do 
        begin

            //OBTER TODAS AS MATRIZES DISTINSTAS POSSIVEIS DE TAMANHO T NA MATRIZ 

            copia_matriz_quadrada(m,quadradoAux,i,j,t2);
        
            if eh_magico(quadradoAux, t2) then 
                qntd_magicos := qntd_magicos + 1;

        end;
    end;
end;

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}
var
    quadrado : t_matriz;
    tamanho, qntdMagicosTotal, i: integer;

begin
    qntdMagicosTotal := 0;

    ler_matriz(quadrado,tamanho);

    for i := 2 to tamanho do 
    begin
            qntdMagicosTotal := qntdMagicosTotal + qntd_magicos(quadrado,tamanho,i);
    end;

    writeln(qntdMagicosTotal);

end.