program questao1;

var 
    saldo : single;
    anos, meses, mesAtual: cardinal;

begin
    anos := 0;
    meses := 0;
    mesAtual := 4;
    saldo := 50;

    while (saldo < 20000) do 
    begin
    writeln('Saldo: ', saldo:0:2 ,' obtido em ', anos, ' anos e ', meses, ' meses.   -   Mes Atual: ',mesAtual, ' Juros : ',(0.5 * (saldo / 100)):0:10);
        saldo := saldo + (0.5 * (saldo / 100)); // aumentos dos 0.5% ao mês


       if (meses = 12) then                 // verifica a virada de ano
        begin
            meses := 0;
            anos := anos + 1;
        end;
        
        if (mesAtual = 5) then                  // verifica se é aniversário
            saldo := saldo + 200;
        
        if (mesAtual = 12) then                // verifica se é natal
        begin
            saldo := saldo + 300;
            mesAtual := 0;
        end;

        saldo := saldo + 50;

        mesAtual:= mesAtual + 1;
        meses := meses + 1;

    end;

    writeln('Saldo: ', saldo:0:2 ,' obtido em ', anos, ' anos e ', meses, ' meses.');

end.