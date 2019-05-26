program matrizPermutacao;
const
    max = 100;
type
    dados = array [1..max,1..max] of integer;

procedure lerMatriz(var mat : dados; var t : integer);
var i,j : integer;
begin
    read(t);
    for i := 1 to t do 
        for j := 1 to t do
            read(mat[i,j]);
end;

function linhas(matriz : dados; t: integer) : boolean;
var 
    i,j: integer;
    zeros, uns : integer;
begin
    linhas := true;
    for i:= 1 to t do 
    begin 
    zeros := 0; uns := 0;
        for j := 1 to t do 
        begin
            if matriz[i,j] = 1 then uns := uns + 1;
            if matriz[i,j] = 0 then zeros := zeros + 1;
        end;
        if (uns <> 1) or (zeros <> (t-1)) then 
            linhas := false;
    end;
end;

function colunas(matriz : dados; t: integer) : boolean;
var 
    i,j: integer;
    zeros, uns : integer;
begin
    colunas := true;
    for i:= 1 to t do 
    begin 
    zeros := 0; uns := 0;
        for j := 1 to t do 
        begin
            if matriz[j,i] = 1 then uns := uns + 1;
            if matriz[j,i] = 0 then zeros := zeros + 1;
        end;

        if (uns <> 1) or (zeros <> (t-1)) then 
            colunas := false;
    end;
end;

var 
    matriz : dados;
    t : integer;
begin
    lerMatriz(matriz,t);
    if linhas(matriz, t) and colunas(matriz,t) then writeln('sim') else writeln ('nao');
end.