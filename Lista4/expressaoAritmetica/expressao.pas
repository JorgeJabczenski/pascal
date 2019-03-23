program expressao;

var 
    x, a, b, c, d, e, f : real;

begin
    read (a, b, c, d, e, f);

    if ((c - d) <> 0) and ((a * b) <> 0) and (((f / (a * b)) + e) <> 0) then 
        writeln( (   ((a + b) / (c - d)) * e  ) / ( (f / (a * b)) + e ))
    else 
        write('divisao por zero');
end.