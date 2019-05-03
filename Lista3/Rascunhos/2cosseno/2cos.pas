program somaserie;

function ifatorial(num:integer) : extended;
var
    aux : extended;
    g : integer;

begin
    g := num;
    aux := 1;
    while (num > 1) do
    begin
        aux := aux * num;
        num := num - 1;
    end;
    ifatorial := 1 / aux;
    writeln('ifatorial de ', g, ' === ', 1 / aux);
end;


var
    soma, atual, anterior : extended;
    contador, numero : integer;

begin
    anterior := 0;
    contador := 0;
    soma     := 1;
    numero   := 4;

    atual := ifatorial(2);

    while(abs(anterior - atual) > 0.000001) do
    begin
        if (contador mod 2) = 0 then
            soma := soma - atual
        else 
        begin
            soma := soma + atual;
        end;

        
        anterior := atual;
        atual := ifatorial(numero);

        writeln('Diferenca === ', anterior - atual : 0:7);

        numero := numero + 2;

        contador := contador + 1;
    end;
    writeln('Soma :=:=:= ', soma:0:15);
end.