program pascal;
var 
    triangulo: array[1..100,1..100] of longint;
    n, linha, coluna : integer;

begin
    triangulo[1,1] := 1;

    read(n);
    writeln(triangulo[1,1]);
    for linha:= 2 to n do 
    begin
        for coluna:= 1 to linha do 
        begin
            triangulo[linha,coluna] := triangulo[linha-1, coluna] + triangulo[linha-1, coluna-1];
            write(triangulo[linha, coluna],' ');
        end; // end for linha
        writeln;
    end; // end for coluna
    
end.
