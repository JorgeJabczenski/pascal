program maxsom;
type
    Aint = array[1..500] of integer;

var 
    somaVetor,maior, tamanho,i,j: integer;
    entrada : Aint;

    procedure lerVetor(var v : Aint; t : integer);
    var i,n : integer;
    begin
        for i := 1 to t do
        begin
            read(n);
            v[i] := n;
        end;    
    end;

procedure imprimirVetor(v:Aint; t:integer);
var i : integer;
begin
    for i:= 1 to t do write(v[i],' ');
    writeln;   
end;

procedure somar(v:Aint; a,t : integer;var m:integer);
var i,j, sominha : integer;
begin
    for i := 1 to t-(a-1) do // Faz a quatidade de loops baseado nos agrupamentos 
    begin
        sominha := 0;
        for j:= i to i+(a-1) do 
        begin
            sominha := sominha + v[j];
        end;   
        //writeln('SOMINHA ',i,' := ',sominha);
        if sominha > m then m := sominha;
    end;

end;

begin
    read(tamanho);
    lerVetor(entrada,tamanho);
    
    //Primeiro max = somar todos os elemtentos do vetor
    maior := 0;
    for i := 1 to tamanho do 
        maior := maior + entrada[i];
    //writeln('MAIOR por enquanto = ',maior);

    for i := 1 to tamanho -1 do 
    begin
        somar(entrada,i,tamanho,maior);
        //writeln('NOVO MAIOR ESSA ATE ESSA RODADA = ',maior);
    end;
    writeln(maior);
end.