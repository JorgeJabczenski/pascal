program segundosemgraus;

var
    entrada, minutos, segundos, graus : integer;

begin
    write('Entre com a quantidade de segundos: ');
    read(entrada);
    segundos := entrada mod 60;
    entrada := entrada div 60;
    minutos := entrada mod 60;
    entrada := entrada div 60;
    graus := entrada;

    write (graus,'grau(s), ',minutos,'minuto(s), ',segundos,'segundo(s)');

    
end.