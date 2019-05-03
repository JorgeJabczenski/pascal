program compara;

var  
    lista1 : array [1..100] of integer;
    lista2 : array [1..100] of integer;
    lista3 : array [1..100] of integer;
    indice1, indice2, num, contador: integer;
    iguais : boolean;

begin 
    iguais := true;
    contador := 1;

    indice1 := 1;
    read(num);
    while(num <> 0) do
    begin
        lista1[indice1] := num;
        indice1 := indice1 + 1;
        read(num);
    end;

    indice2 := 1;
    read(num);
    while(num <> 0) do
    begin
        lista2[indice2] := num;
        indice2 := indice2 + 1;
        read(num);
    end;

    if (indice1 <> indice2) then
        writeln('Tamanhos diferentes')
    else
    begin
        for num := indice1-1 downto 1 do
        begin
            lista3[contador] := lista1[num];
            contador := contador + 1;
        end;

        for num := 1 to indice1-1 do
        begin
            if (lista3[num] <> lista2[num]) then
                iguais := false;
        end;

    if (iguais) then
        writeln('Sim')
    else
        writeln('Nao');

    end;


end.