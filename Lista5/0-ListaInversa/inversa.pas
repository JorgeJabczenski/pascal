program inversa;
var 
    lista1 : array [1..100] of integer; 
    lista2 : array [1..100] of integer;
    indice1, indice2, num : integer;

begin 
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

    for num := indice1-1 downto 1 do 
        write(lista1[num],' ');
    
    writeln;

    for num := indice2-1 downto 1 do 
        write(lista2[num],' ');
    
    writeln;

end.