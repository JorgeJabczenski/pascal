program mediaPonderada;

var 
    m,p, somaP : integer;
    n, result, mediaTotal : real;

begin
    somaP:= 0; result := 0;
    read(m);
    if (m > 0) then 
    begin
        while(m > 0) do 
        begin
            read (n,p);
            somaP := somaP + p;
            result := result + (n*p);
            m := m - 1;
        end; // end while

        if (somaP > 0) then 
        begin
            mediaTotal := result / somaP;
            writeln(mediaTotal);
        end // end if somaP > 0
        else 
            writeln('divisao por zero');
    end // end if m > 0
    else 
        writeln('divisao por zero');
end.