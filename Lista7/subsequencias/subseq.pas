program subseq;

type vetor = array[1..200] of longint;

var
    entrada : vetor;
    num, pos, seq : longint;

procedure lerVetor(var v : vetor; t : integer);
var i,n : integer;
begin
    for i := 1 to t do
    begin
        read(n);
        v[i] := n;
    end;    
end;

procedure achaSequencia(v : vetor; s,n : longint);
var 
    aux : vetor;
    i,j,c: integer;
    igual : boolean;
begin
    for i := 1 to n - (s - 1) do 
    begin
        igual := true;
        for j := 1 to s do
        begin
            aux[j] := v[i + (j - 1)];
            write (aux[j],' ');
        end;
        writeln;    

        for j:= 1 to s do 
        begin
            writeln(aux[j],'----',v[j+i]);
        end;
        
        writeln('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
    end;
end;


begin 
    pos := 0;
    read(num);
    lerVetor(entrada,num);
    seq := num div 2;

    while (pos = 0) and (seq >= 2) do 
    begin
        achaSequencia(entrada,seq,num);
        seq := seq - 1;
    end;
    
end.