program equacoes;

var
    a, b, c : real;

begin
    read (a, b, c);
    while((a <> 0) or (b <> 0) or (c <> 0)) do 
    begin
        if (a = 0) then
            writeln('nao eh equacao do segundo grau')
        else if ((b * b) - (4 * a * c)) < 0 then
            writeln('nao tem raizes reais')
        else if ((b * b) - (4 * a * c)) = 0 then
            writeln(-b / (2 * a) :0:2)
        else 
            writeln(( -b - sqrt((b * b) - (4 * a * c)) ) / (2 * a) :0:2 ,' ', (-b + sqrt((b * b) - (4 * a * c)) ) / (2 * a) : 0:2);

    read (a, b, c);
    end; // end while
   
end.