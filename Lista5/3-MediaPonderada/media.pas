program media;

var 
    provas : array[1..3 , 1..100] of real;
    medias : array[1..100] of real;
    //prova2: array[100] of real;
    //prova3: array[100] of real;
    numAlunos, linha, coluna : integer;
    nota : real;

begin
    read(numAlunos);

    for linha := 1 to 3 do 
    begin
        for coluna :=1 to numAlunos do
        begin
            read(nota);
            provas[linha,coluna] := nota;
        end;
    end;

    for coluna := 1 to numAlunos do
    begin
        medias[coluna] := (provas[1,coluna] + provas[2,coluna] * 2 + provas[3,coluna] * 3) / 6 ;
        write('Aluno ',coluna,': ',medias[coluna]:0:2,' ');
        if (medias[coluna] >= 70) then
            writeln('Aprovado')
        else if (medias[coluna] < 40) then 
            writeln('Reprovado')
        else 
            writeln('Final');
    end;
end.