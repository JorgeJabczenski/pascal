program mahico;
const 
    MAX = 100;
type
    t_matriz = array[0..MAX, 0..MAX] of integer;

    t_quadrado = record
        matriz : t_matriz;
        tam : integer;
    end;

procedure lerMatriz(var q : t_quadrado);
var 
    i,j : integer;
begin
    for i := 1 to q.tam do
        for j := 1 to q.tam do 
            read(q.matriz[i][j]);
end;


{======================= VARIAVEIS =======================}
var
    quadrado : t_quadrado;
    i, j, somaAtual, somaAnterior: integer;
    igual : boolean;

{======================= PROGRAMA PRINCIPAL =======================}
begin
    read(quadrado.tam);
    lerMatriz(quadrado);

    somaAnterior := 0;
    somaAtual := 0;
    igual := true;

    for i := 1 to quadrado.tam do
    begin
        somaAtual := 0;
        for j := 1 to quadrado.tam do 
        begin
            somaAtual := somaAtual + quadrado.matriz[i,j];        
        end;
        if (i > 1) then
        begin
            if somaAtual <> somaAnterior then igual := false;
        end
        else 
            somaAnterior := somaAtual;
    end;

    for i := 1 to quadrado.tam do
    begin
        somaAtual := 0;
        for j := 1 to quadrado.tam do 
        begin
            somaAtual := somaAtual + quadrado.matriz[j,i];
        end;
       // writeln('Soma da linha ',i,' eh ',somaAtual);     
        if (i > 1) then
        begin
            if somaAtual <> somaAnterior then igual := false;
        end
        else 
            somaAnterior := somaAtual;
    end;

    if igual then writeln('sim ') else writeln ('nao');

end.