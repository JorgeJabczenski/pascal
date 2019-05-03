program Idades;

var
    idade, men20, ent2040, mais60: integer;

begin
    men20 := 0;
    ent2040 := 0;
    mais60 := 0;

    writeln('Entre com a idade das pessoas: ');
    read (idade);
    while (idade > 0) do 
    begin
        if idade mod 5 <> 0 then
        begin
            if idade < 20 then 
                men20 := men20 + 1
            else if idade < 40 then
                ent2040 := ent2040 + 1
            else if idade > 60 then
                mais60 := mais60 + 1;
        end;
        read(idade);
    end;
    writeln('menores que 20: ',men20);
    writeln('entre 20 e 40: ', ent2040);
    write ('maiores que 60: ', mais60);
end.