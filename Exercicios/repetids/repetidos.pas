program rep;

type vetor = array[1..100] of integer;

var
    i,j,c,tR: integer;
    entrada,repetidos : vetor;
    repetido : boolean;

begin
    for i := 1 to 16 do read(entrada[i]);

    tR := 0;

    for i := 1 to 15 do
    begin
        for j := i+1 to 16 do
        begin
            repetido := false;
            writeln(entrada[i],' ',entrada[j]);
            if entrada[i] = entrada[j] then
            begin
                writeln ('ham');
                repetido := true;
                for c := 1 to tR do 
                    if entrada[i] = repetidos[c] then
                         repetido := false;
            end; 
            if repetido then
            begin
                tR := tR + 1;
                repetidos[tR] := entrada[i];
            end;
        end;
    end;

    writeln;
    for i := 1 to tR do write(repetidos[i], ' '); writeln;
end.