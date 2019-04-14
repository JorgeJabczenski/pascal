program serie;
var
    soma, anterior, fator : extended;
    cont, num, i, aux : longint;
    
begin
    soma     := 1;
    cont     := 1;
    num      := 2;
    anterior := 0; 

    
    i   := num;
    aux := 1;
        
    while(i > 1) do
    begin
        aux := aux*i;
        i := i - 1;
    end;
        
    fator := 1/aux;

    writeln(fator);
    
        
    
    while(abs(anterior - fator) > 0.000001) do
    begin
        writeln('diferença: ', abs(anterior - fator):0:6);
        writeln('soma : ', soma:0:15);

        if (cont mod 2) = 0 then
            soma := soma + fator
        else
            soma := soma - fator;
        
        anterior := fator;
        num := num +2;
        
        i   := num;
        aux := 1;
        
        while(i > 1) do
        begin
            aux := aux*i;
            i := i - 1;
        end;
        
        fator := 1/aux;
        
        cont:= cont + 1;
       // num := num + 2;
        
    end; // end while
    
    writeln(soma:0:15);
end.
