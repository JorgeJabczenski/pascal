program km2ml;

var
    km : real;

begin
    //write('Entre com a velocidade em km/h: ');
    read(km);
    writeln (km / 1.609344 :0:4,' ml/h');
end.
