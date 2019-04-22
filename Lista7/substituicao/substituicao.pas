program substituicao;
type 
    vetor = array[1..200] of integer;

var 
    v1,v2,v3 : vetor;
    t1,t2,t3 : integer;
    pos_inicio, pos_final : integer;
    i : integer;
    diferente : boolean;


//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure lerVetor(var v: vetor; var t : integer);
var 
    num : integer;
begin
    t:= 0;
    read(num);
    while(num <> 0) do 
    begin
        t := t + 1; 
        v[t] := num;
        read(num);
    end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure imprimeVetor(v:vetor; t : integer);
var i : integer;
begin
    for i := 1 to t do write(v[i],' ');
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function ocorre(v1,v2 : vetor ; t1,t2 : integer; var posi, posf : integer) : boolean;
var
    i, c : integer;

begin
    i := 0; 
    ocorre := false;

    while (i + t2 <= t1) and not ocorre do 
    begin
        ocorre := true;
        for c:= 1 to t2 do 
            if v1[i + c] <> v2[c] then ocorre := false;
        i := i + 1;
    end;
    if ocorre then 
    begin
        posi := i;
        posf := i + t2 - 1;
        //writeln('POSI = ', posi, ' || POSF = ', posf);
    end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure substituirVetor(var v1, v3 : vetor;var t1 : integer; t3, pi, pf : integer);
var 
    i, indiceAux : integer;
    aux : vetor;

begin
    indiceAux := 1;

    for i := 1 to pi-1 do 
    begin
        aux[indiceAux] := v1[i];
        indiceAux := indiceAux + 1;
    end;
    //write(' ');
    for i := 1 to t3 do 
    begin
        aux[indiceAux] := v3[i];
        indiceAux := indiceAux + 1;
    end;
    //write(' ');
    for i:= pf to t1-1 do
    begin
        aux[indiceAux] := v1[i+1];
        indiceAux := indiceAux + 1;
    end; 

    imprimeVetor(aux,indiceAux-1);

end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

begin
    diferente:= true;
    i:= 1;

    lerVetor(v1,t1);
    lerVetor(v2,t2);
    lerVetor(v3,t3);

    if (t1 = t2) then 
    begin
        diferente:= false;
        for i := 1 to t1 do 
        begin
            if (v1[i] <> v2[i]) then diferente := true;
        end; 
    end;

    if diferente then 
    begin
        if ocorre(v1, v2, t1, t2, pos_inicio,pos_final) then 
        begin
            //writeln('SIM');
            substituirVetor(v1, v3, t1, t3, pos_inicio, pos_final);
        end 
        else 
        imprimeVetor(v1, t1);
        writeln;
    end
    else writeln('nenhuma');
end.