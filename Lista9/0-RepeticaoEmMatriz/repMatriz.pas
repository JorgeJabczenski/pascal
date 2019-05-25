program repMatriz;
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

function temRepetido(matriz : dados; m,n : integer) : boolean;
var i,j,k,l,x : integer;
begin
    temRepetido := false;
    for i := 1 to m do
        for j := 1 to n do 
        begin
            for k := 1 to m do
                for l := 1 to n do
                    if (matriz[i,j] = matriz[k,l]) and  ((k <> i) or (l <> j)) then 
                        temRepetido := true;
        end;
end;

var
    m,n : integer;
    matriz : dados;
begin
    lerMatriz(matriz,m,n); 
    if temRepetido(matriz,m,n) then writeln ('sim') else writeln ('nao');
end.
