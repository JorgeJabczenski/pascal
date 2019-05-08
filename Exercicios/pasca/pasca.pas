program pasca;
type
    vetor = array[1..100] of integer;

    var
        a,b : vetor;
        i,j, num,l,c : integer;

begin
    read(num);
    a[1] := 1;
    writeln(a[1]);

    for i := 2 to num do
    begin
        c := 2;
        l := i;
        b[1] := 1;
        write(b[1],' ');
        while c <= l do
        begin
            b[c] := a[c] + a[c-1];
            write(b[c],' ');
            c := c+1;
        end;
        writeln;
        for j := 1 to i do a[j] := b[j];
    end;

end.