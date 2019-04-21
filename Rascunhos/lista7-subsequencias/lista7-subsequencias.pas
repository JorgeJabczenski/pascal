program lista7subsequencias;

type 
    vetor = array [1..300]  of longint;

var 
    entrada : vetor;
    pos, num, tamanho_subsequencia, cont: longint;


//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

procedure lerVetor(var v : vetor; t : longint); // Procedimento que preenche um vetor de tamanho 't'
var n,i : longint;
begin
    for i := 1 to t do 
    begin
        read(n);
        v[i] := n;
    end; 
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

function acharSequencia(v : vetor; s,t : longint) : longint;
var 
    i,j,c : longint;
    igual, continua : boolean;

begin
    i := 0;
    igual := false;
    continua := true;

    while(i+s <= t) and continua do 
    begin
        j := i + s; 
        while(j + s <= t) and not igual do 
        begin
            igual := true;

            for c := 1 to s do
                if v[i+c] <> v[j+c] then igual := false;       

            j := j + 1;
        
        end;

        if igual then 
        begin
            continua := false;
            acharSequencia := i+1;
        end
        else
            acharSequencia := 0;
        i := i + 1;

    end;
end;

//;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

begin
    read(num);             // Le o tamanho do vetor a ser lido
    lerVetor(entrada,num); // Chama o procedimento que vai ler todos os valores e armazenar no vetor
    
    pos := 0;
    cont := 2;
    tamanho_subsequencia := num div 2;

    while (tamanho_subsequencia >= 2) and (pos = 0) do 
    begin
        pos := acharSequencia(entrada,tamanho_subsequencia,num);
        tamanho_subsequencia := tamanho_subsequencia - 1; 
    end;

    if pos = 0 then writeln('nenhuma') else writeln(pos, ' ', tamanho_subsequencia + 1);

end.