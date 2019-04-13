program unicaoFuncao;
var
    conjunto : array[1..300] of longint;
    indice, umZero, num, compara, vish : longint;
    diferente : boolean;

begin
    indice := 0; umZero := 0;
    while(umZero < 2) do 
    begin
        diferente := true;
        read(num);
        if num = 0 then umZero := umZero + 1
        else 
        begin 
            for vish := 1 to indice do if num = conjunto[vish] then diferente := false;
            if diferente then 
            begin 
                indice := indice + 1;
                conjunto[indice] := num;
            end;
        end;
    end;
    for umZero := 1 to indice do write(conjunto[umZero],' ');
    writeln;
end.

