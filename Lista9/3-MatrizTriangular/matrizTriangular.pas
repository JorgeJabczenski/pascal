program matrizTriangular;
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
            read(mat[i][j]);
end;

function triangularInferior(matriz : dados; t : integer):boolean;
var i,j, soma : integer;
begin
    triangularInferior := false;
    soma := 0;
    for i := 1 to t do 
    begin
        for j := i + 1 to t do 
        begin
            soma := soma + matriz[i][j];
        end;
    end; 
    if soma = 0 then triangularInferior := true;// else writeln('NAO E INFERIOR');
end;

function triangularSuperior(matriz : dados; t : integer):boolean;
var i,j, soma : integer;
begin
    triangularSuperior := false;
    soma := 0;
    for i := 2 to t do 
    begin
        for j := 1 to i-1 do 
        begin
            soma := soma + matriz[i][j];
        end;
    end; 
    if soma = 0 then triangularSuperior := true;// else writeln('NAO E SUPERIOR');
end;

var 
    matriz : dados;
    t : integer;

begin
    lerMatriz(matriz,t);
    if triangularSuperior(matriz,t) or triangularInferior(matriz,t) then writeln('sim') else writeln ('nao');
end.