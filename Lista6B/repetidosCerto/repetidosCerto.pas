program repetidosCerto;

var 
    entrada, saida : array[1..200] of integer;
    ie, io, count, num, cc: integer;
    repetido : boolean;

begin
    count := 0;
    ie:= 0;
    io := 1;

    read(num);
    while(num <> 0) do 
    begin
        ie := ie + 1;
        entrada[ie] := num;
        read(num);
    end;

    for num := 1 to ie do
        saida[num] := 0;


    for num := 1 to ie do 
    begin
        repetido := false; count := num+1;
        while(count <= ie) and (not (repetido)) do 
        begin
            if entrada[num] = entrada[count] then 
            begin
                repetido := true;
                for cc:= 1 to io do 
                begin
                    if entrada[num] = saida [cc] then
                    begin 
                        repetido := false;
                        break;
                    end;
                end;


            end;
            count := count + 1;
        end;

        if repetido then 
        begin

            saida[io] := entrada[num];
            io := io + 1;
        end;
    end;

        for count := 1 to io-1 do 
            write(saida[count],' ');
        writeln;

end.
