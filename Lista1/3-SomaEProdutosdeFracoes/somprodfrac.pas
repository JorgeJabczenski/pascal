
(*
program somprodfrac;

var
    a, b, c, d, resto, mema, memb, memc, memd, mmc: integer;

begin
    resto := 1;
    write('Entre com a e b: ');
    readln (a,b);
    write('Entre com c e d: ');
    readln (c,d);

    mema := a;
    memb := b;
    memc := c;
    memd := d;

    while (resto <> 0) do
    begin
        resto := b mod d;
        b := d;
        d := resto;
    end;

    mmc := (memb * memd) div b;

    a := (a * mmc) div memb;
    c := (c * mmc) div memd;

    writeln('A soma = ', a+c, '/', mmc);
    write  ('O produto = ', mema * memc, '/',memb * memd);
    
end.
*)
program somprodfrac;

var
    a, b, c, d: integer;

begin
    writeln('Entre com a e b: ');
    read   (a,b);
    writeln('Entre com c e d: ');
    read   (c,d);

    writeln('A soma = ', a*d + c*b, '/', b*d);
    write  ('O produto = ', a * c, '/',b * d);
    
end.
