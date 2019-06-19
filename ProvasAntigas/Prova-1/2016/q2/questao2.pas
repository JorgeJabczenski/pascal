
(*
program questao2;

var 
    a, b, tamanho, salvaa: cardinal;
begin
    tamanho := 1;

    read(b,a);
    salvaa := a;
    while(a > 0) do
    begin
        a := a div 10;
        tamanho:= tamanho * 10;
    end;

    if ((b mod tamanho) = salvaa) then
        writeln('ENCAIXA')
    else
    begin
        writeln('NAO ENCAIXA');
    end;
end.

*)

program questao2;

var 
    a, b : cardinal;
    igual : boolean;
begin
    igual := true;

    read (a,b);

    while (b > 0) and (igual = true) do
    begin 
        if ((a mod 10) <> (b mod 10))then
            igual := false;

        a := a div 10;
        b := b div 10;
    end; 

    if (igual = false) then
        write('NAO ');

    writeln('ENCAIXA');
end.
