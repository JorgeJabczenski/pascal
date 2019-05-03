program kalternate;

var 
    modulo, moduloAnterior, num, k, contador : integer;
    ehkalternate : boolean;


begin
    contador := 1;
    ehkalternate := true;

    read(k);
    read(num);

    modulo := num mod 2;
    moduloAnterior := modulo;

    read(num);

    while(num <> 0) and (ehkalternate = true) do
    begin
        if (contador = k) then // alterna o tipo de checagem
        begin
            contador := 0;
            
            if modulo = 1 then  
                modulo:= 0
            else
                modulo := 1;
        end;

        if modulo <> (num mod 2) then
            ehkalternate := false;

        read(num);
        contador := contador + 1;

    end;

    if ehkalternate then  
        writeln('eh kalternate')
    else
        writeln('eh nada');
end.