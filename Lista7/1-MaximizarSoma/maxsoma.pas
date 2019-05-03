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

procedure somar(v:Aint; a,t : integer;var m:integer);
var i,j, sominha : integer;
begin
    for i := 1 to t-(a-1) do    // Faz a quatidade de loops baseado nos agrupamentos 
    begin
        sominha := 0;
        for j:= i to i+(a-1) do     // Mesma coisa que ali em cima
        begin
            sominha := sominha + v[j];
        end;   
        if sominha > m then m := sominha;   // Verifica se é maior que a maior soma até agora
    end;
end;

begin
    read(tamanho);
    lerVetor(entrada,tamanho);
    
    
    maior := 0;
    for i := 1 to tamanho do  maior := maior + entrada[i];  //Primeiro maior = somar todos os elemtentos do vetor

    for i := 1 to (tamanho-1) do somar(entrada,i,tamanho,maior); // t - 1 pois o primeiro todos os elementos somados já foi feito ali em cima
    
    writeln(maior);
end.