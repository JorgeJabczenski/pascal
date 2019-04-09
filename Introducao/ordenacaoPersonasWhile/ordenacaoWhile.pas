program ordenacaoPersonas;

var
    personas: array [1..101] of integer;
    temporario, n, c: integer;
    vezes : longint;

begin
    n:= 100;
    vezes := 0;
    randomize;

    // Gerar 100 datas aleatórias
    for c:= 1 to 100 do 
        personas[c] := random(101) + 1900;

    // bubble sort
    while n > 1 do
    begin
        c := 1;
        while c < n do 
        begin
            if personas[c] > personas[c+1] then
            begin
                temporario := personas[c+1];
                personas[c+1] := personas[c];
                personas[c] := temporario;
            end;
                vezes := vezes + 1;
            c := c+1;
        end;
        n := n-1;
    end;

    for c := 0 to 100 do 
     write(personas[c],' ');

    writeln;
    writeln(vezes);

end.