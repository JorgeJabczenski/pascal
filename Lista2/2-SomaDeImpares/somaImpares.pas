program Soma_intervalo;

var
    A, B, soma: integer;

begin
    soma := 0;
    writeln ('Entre com os valores de A e B: ');
    read(A,B);

    while A <= B do 
    begin
        soma := soma + A;
        A := A+2;
    end;
    writeln('Soma: ',soma);
end.