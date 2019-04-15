program repetidos;

var 
    entrada, saida : array[1..100] of integer;
    ie, io, count, num: integer;
    repetido : boolean;

begin
    count := 0;
    ie:= 0;
    io := 0;
    read(num);

    while(num <> 0) do 
    begin
        ie := ie + 1;
        entrada[ie] := num;
        read(num);
    end;

    for num := 0 to ie do 
    begin
        repetido := false; count := 1;
        
        while (not (repetido)) and (count<= io) do 
        begin
            
            if entrada[num] = saida[count] then 
                repetido := true;
            count := count + 1;
        end;
        
        if (not (repetido)) then 
        begin
            saida[io] := entrada[num];
            io := io + 1;
        end;
    end;
    

    for count := 1 to io-1 do 
        write(saida[count],' ');
    writeln;
end.