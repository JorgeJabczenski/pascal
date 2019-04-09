program ordenacaoPersonas;

var
    personas: array [1..101] of integer;
    i, j, temporario: integer;
    vezes: longint;

begin
    vezes := 0;
    randomize;

    // Gerar 100 datas aleatórias
    for i:= 1 to 100 do 
        personas[i] := random(101) + 1900;

    // bubble sort
    for i:= 1 to 100 do 
    begin
        for j:= 1 to 100 do 
        begin
        
            if personas[j] > personas[j+1] then
            begin
                temporario    := personas[j+1];
                personas[j+1] := personas[j];
                personas[j]   := temporario; 
            end;
                vezes := vezes + 1;
        
        end;
    end;

    for i := 0 to 100 do 
     write(personas[i],' ');

    writeln;
    write(vezes);

end.