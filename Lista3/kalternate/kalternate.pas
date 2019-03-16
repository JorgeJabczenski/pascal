program ehkalternate;

var
    k, num, count : cardinal;
    modulo, nao : boolean;

begin
    count := 0;
    nao := false;
    read(k);
    read(num);
    modulo := odd(num);
    writeln('numero: ',num, '  modulo: ',modulo);
    while num > 0 do
    begin
        count := count + 1;

        if count = k then
        begin
            count := 0;
            modulo := not(modulo);
        end; // end if

        read (num);
        if odd(num) <> modulo then
        begin
            writeln('Nao eh k-alternante');
            
            nao := true;
            break;
        end; // end if
    writeln('numero: ',num, '  modulo: ',modulo, '  count: ',count);
    end; // end while

    if not(nao) then
        writeln('Sim eh k-alternante');
end.