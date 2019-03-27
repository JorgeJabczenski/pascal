program questao3;

var 
    n, k, entrada, sinal, contador, limite: cardinal;
    ehkalternate : boolean;

begin
    read(n);
    ehkalternate := true;
    limite := 1;
    k := 1;

    if (n = 0) then 
        ehkalternate := false;

    
    if ehkalternate then
    begin
        read(entrada);
        contador := 1;
        sinal := entrada mod 2;
    end;

    writeln('Sinal: ', sinal, ' N: ', n,' entrada: ', entrada, ' k: ',k,' limite: ', limite, ' contador: ', contador);
    while (n > 1) and (ehkalternate = true) do 
    begin

        if (contador = limite) then
        begin
            contador := 0;
            k := k + 1;
            limite := limite + 1;

            if sinal = 1 then 
                sinal := 0
            else
                sinal := 1;

        end; // end if

        read (entrada);

        if (entrada mod 2) <> sinal then
            ehkalternate := false;

        contador := contador + 1;

        n := n-1;
    writeln('Sinal: ', sinal, ' N: ', n,' entrada: ', entrada, ' k: ',k,' limite: ', limite, ' contador: ', contador);
    end; // end while

    if contador <> limite then 
        ehkalternate := false;

    if (ehkalternate) then  
        writeln(k,'-alternate')
    else 
        writeln('NAO');

end.