program uniao;
const
    max = 100;
var 
    cA, cB, cU : array[1..max] of integer;
    iA, iB, iU, tA, tB, tU, num, cFor, cWhile: integer ;
    repetido : boolean;

begin
    tA := 0; tB := 0; tU := 0; iA := 0; iB := 0; iU := 0;

    read(num); // Leitura de Números do Conjunto A
    while(num <> 0) do 
    begin
        iA := iA + 1;
        cA[iA] := num;
        read(num);
    end;
    tA := iA;

    read(num); // Leitura de Números do Conjunto B
    while(num <> 0) do 
    begin
        iB := iB + 1;
        cB[iB] := num;
        read(num);
    end;
    tB := iB;
    
    for cFor:= 1 to tA do  // Inserir os elementos do Conjunto A no Conjunto U(nião)
    begin 
        cWhile := 1; repetido := false;
        while(not(repetido)) and (cWhile <= iU) do 
        begin
            if cA[cFor] = cU[cWhile] then 
                repetido := true;

            cWhile := cWhile + 1;

        end; // end while

        if (not repetido) then
        begin
            iU := iU + 1;
            cU[iU] := cA[cFor];
        end;
    end; // end for

    for cFor:= 1 to tB do  // Inserir os elementos do Conjunto B no Conjunto U(nião)
    begin 
        cWhile := 1; repetido := false;
        while(not(repetido)) and (cWhile <= iU) do 
        begin
            if cB[cFor] = cU[cWhile] then 
                repetido := true;

            cWhile := cWhile + 1;

        end; // end while

        if (not repetido) then
        begin
            iU := iU + 1;
            cU[iU] := cB[cFor];
        end;
    end; // end for

    for num := 1 to iU do
        write(cU[num],' ');
    writeln; 
end.