program Somatorio;

var
    num, guarda : integer;
    soma : single;

begin
    soma := 0;
    writeln ('Entre com um inteiro positivo: ');
    read(num);
    guarda := num;

    while num > 0 do
    begin
        soma := soma + ((guarda + 1)- num)/num;
        num := num - 1;
    end;

    writeln('Somatorio: ', soma:0:2);
end.