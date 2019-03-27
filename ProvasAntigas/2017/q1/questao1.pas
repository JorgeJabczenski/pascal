program questao1;

var  
    n, expoente, i: integer;
    s, numerador: real;

begin 
    s := 0; expoente := 1;
    read(n);

    s:= 1 / (n * n);

    n := n - 1;

    while n > 0 do 
    begin
        numerador := 1;
        for i:= 0  to expoente-1 do
        begin
            numerador := numerador * 2; 
        end;
        
        s := s + (numerador / (n * n));
       
    expoente := expoente + 1;
    n := n - 1;
    end; // end while

    writeln(s);

end.