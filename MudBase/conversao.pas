program conversao;
(*

Implementar : 
    Fatorial
    Numeros primos

*)
var 
    operacao : integer;
    rodar    : boolean; 


procedure decToBin();
begin

end;

procedure binToDec();
begin

end;

begin

    rodar := true;

    writeln(' _______   ______            _______                      ______    ____     ______    _____     ______   ');
    writeln('|         |      |  |       |         |      |  |        |      |  |    \   |      |  |     |   |      |  ');
    writeln('|         |      |  |       |         |      |  |        |      |  |     \  |      |  |     |   |      |  ');
    writeln('|         |______|  |       |         |      |  |        |______|  |     |  |      |  |____/    |______|  ');
    writeln('|         |      |  |       |         |      |  |        |      |  |     /  |      |  |     \   |      |  ');
    writeln('|_______  |      |  |_____  |_______  |______|  |______  |      |  |____/   |______|  |      \  |      |  ');

    
    while rodar do 
        begin 

        writeln;
        writeln;
        writeln('   1 - DEC to BIN');
        writeln('   2 - BIN TO DEC');
        writeln;
        writeln;
        
        
        read(operacao);

        case operacao of 

        1 : decToBin();

        2 : binToDec();

        else
            writeln('Opcao Invalida!');
        end;

    end;

end.