program questao2;

var 
    n, j, m, contadorDeIguais, i : integer;
begin
    contadorDeIguais := 0; i := 1;
    read(n,j,m);
    while(contadorDeIguais < n ) do 
    begin
        if (i mod j) = (m mod j) then
        begin
            writeln(i,' ', j,' ', m);
            contadorDeIguais := contadorDeIguais + 1;
        end;
        i := i + 1;
    end;
end.