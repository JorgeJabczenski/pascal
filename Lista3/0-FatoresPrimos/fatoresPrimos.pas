(*
Fazer um programa em Pascal capaz de ler apenas um número inteiro positivo do teclado, de calcular a
decomposiço em fatores primos desse número e de imprimir os fatores calculados.

Exemplos de entrada e saída são:

./fatoresprimos
12 
2 2 3
./fatoresprimos
150 
2 3 5 5
*)
(*
program fatoresprimos;

var
    primos : array [0..100] of integer;
    i ,j, indice : integer;
    nao : boolean;

    entrada : integer;

begin

    nao := false;
    primos[0] := 2;
    indice := 1;
    for i := 2 to 1000 do
    begin
    j := i - 1;
    //writeln('i = ',i,' | j = ',j);
        while j > 1 do 
        begin
           // writeln('MOD ::: ',i mod j);
            if ((i mod j) = 0) then
            begin
                nao := true;
                //writeln('N ::::: ',i);
                break;
            end; // end if

            j := j - 1;
        end; // end while

        if (nao = false) then
        begin
            primos[indice] := i;
            nao := false;
            indice := indice + 1;
            //writeln('P ::::: ',i);
        end;
        nao := false;
    end; // end for


    read (entrada);

    indice:= 0;
    while(entrada <> 1) do
    begin
        for j:= 0 to 600 do
        begin
            if (entrada mod primos[j]) = 0 then
            begin
                entrada := entrada div primos[j];
                write(primos[j],' ');
                break;
            end;
        end;// end for
    end; // end while
    writeln;
    

end.
*)


program fatoresprimos;

var
    num, divisor : integer;
begin
    read(num);
    divisor := 2;
    while(num <> 1) do
    begin
        if (num mod divisor) = 0 then
        begin
            write(divisor, ' ');
            num := num div divisor;
            divisor := 2;
        end
        else 
            divisor := divisor + 1;
    
    end;
    writeln;
end.

