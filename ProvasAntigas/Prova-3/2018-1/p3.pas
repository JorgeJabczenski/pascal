{=================================================================================}
{                                ENTRADAS E SAIDAS                                }
{=================================================================================}
{

ENTRADA

6
2 3 1 5 2 3  
4 1 3 2 1 1   
2 2 1 1 3 2   
3 5 1 1 2 3  
2 1 4 4 1 4   
5 5 2 3 4 3

SAIDA

3 2 4 0 3 2
1 4 2 3 4 4
3 3 4 4 2 3
2 0 4 4 3 2
3 4 1 1 4 1
0 0 3 2 1 2

}

{=================================================================================}
{                                  INICIALIZAÇÃO                                  }
{=================================================================================}

program p3;
const 
    MAX = 200;

type
    t_matriz = array[1..MAX, 1..MAX] of integer;


{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

function achar_X (var m : t_matriz; n, linIni, colIni, t : integer) : boolean;
var i, valor : integer;
begin
    achar_X := true;
    valor := m[linIni][colIni];

    // checar diagonal principal
    for i := 0 to t-1 do 
        if m[linIni+i][colIni+i] <> valor then achar_X := false;

    //checar diagonal secundaria
    for i := t-1 downto 0 do 
        if m[linIni+i][colIni+((t-1)-i)] <> valor then achar_X := false;

end;

{---------------------------------------------------------------------------------}

procedure inverte_cor (var m : t_matriz; t: integer);
var i, j, maior : integer;
begin
    maior := m[1][1];
    for i := 1 to t do 
    begin
        for j := 1 to t do
        begin
            if m[i][j] > maior then
            begin
                maior := m[i,j];
            end; 
        end; 
    end;

    for i := 1 to t do 
        for j := 1 to t do 
            m[i][j] := maior - m[i][j];
end;

{---------------------------------------------------------------------------------}

procedure ler_matriz (var m : t_matriz; t : integer);
var i, j : integer;
begin
    for i := 1 to t do 
    begin
        for j := 1 to t do 
            read(m[i][j]);
    end;
end;

{---------------------------------------------------------------------------------}

procedure imprimir_matriz(var m : t_matriz; t : integer);
var i, j : integer;
begin
    for i := 1 to t do 
    begin
        for j := 1 to t do 
            write(m[i][j],' ');
        writeln;
    end;
end;

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}

var 
    tamanho, i, j, k, tX  : integer;
    matriz  : t_matriz;
    achouX : boolean;

begin
    read(tamanho);
    ler_matriz(matriz, tamanho);
    achouX := false;

    for i := tamanho-1  downto 1 do 
    begin
        for j := tamanho-1 downto 1 do 
        begin
            tX := tamanho-i+1;
            for k := tX downto 2 do 
                if achar_X(matriz, tamanho, i, j, k) then
                    achouX := true;
        end;
    end;

    if achouX then 
        inverte_cor(matriz, tamanho);

    writeln;

    imprimir_matriz(matriz, tamanho);

end.
