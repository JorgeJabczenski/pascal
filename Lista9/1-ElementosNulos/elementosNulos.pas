program elementosNulos;
const
    max = 100;
type
    dados = array [1..max,1..max] of integer;

procedure lerMatriz(var mat : dados; var m,n : integer);
var i,j : integer;
begin
    read(m,n);
    for i := 1 to m do 
        for j := 1 to n do
            read(mat[i,j]);
end;

function linhasVazias(matriz : dados; m,n : integer) : integer;
var 
    i,j,soma: integer;
begin
    linhasVazias := 0;
    for i := 1 to m do
    begin
    soma := 0;
        for j := 1 to n do 
        begin
            soma := soma + matriz[i,j];
        end;
        if soma = 0 then linhasVazias := linhasVazias + 1;
    end;
end;

function colunasVazias(matriz : dados; m,n : integer) : integer;
var 
    i,j,soma: integer;
begin
    colunasVazias := 0;
    for i := 1 to n do 
    begin
        soma := 0;
        for j := 1 to m do 
        begin
            soma := soma + matriz[j,i];
        end;
        if soma = 0 then colunasVazias := colunasVazias + 1;
    end;

end;

var
    matriz : dados;
    m,n : integer;
begin
    lerMatriz(matriz,m,n);
    writeln('linhas: ',linhasVazias(matriz,m,n));
    writeln('colunas: ',colunasVazias(matriz,m,n));
end.