program celsiusToFahrenheit;

var 
    celsius: real;
begin
    //write('Entre com a temperatura em graus Celsius: ');
    read(celsius);

    writeln ((((9*celsius)/5) + 32):0:2,' graus Farenheit');
end.
