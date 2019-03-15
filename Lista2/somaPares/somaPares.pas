program SomaPares;

var 
    n, soma, num, aux: integer;
begin
    soma := 0;
    writeln ('Entre com o valor de n: ');
    read(n);
    aux := n;
    writeln ('Entre com a sequencia: ');
    while n > 0 do 
    begin
        read(num);
        if num mod 2 = 0 then
            soma := soma + num;
        n := n - 1;
    end;
    if aux mod 2 = 0 then
        writeln('Soma: ', soma)
    else
        writeln('impar');
end.