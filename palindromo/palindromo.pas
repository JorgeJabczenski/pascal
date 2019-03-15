program eh_palindromo;

var
    num, reserva, inverso : longint;

begin
    inverso := 0;
    
    read(num);
    reserva := num;

    while (reserva > 0) do
    begin
        inverso := inverso * 10;
        inverso := inverso + (reserva mod 10);
        reserva := reserva div 10;
    end;

    if (inverso = num) then
        writeln('Sim eh palindromo')
    else
    begin
        writeln('Nao eh palindromo')
    end;

end.