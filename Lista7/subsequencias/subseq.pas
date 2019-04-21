(*
Faça um programa em Free Pascal que leia um número natural 0 < n ≤ 100 e em seguida leia uma 
sequência de n números também naturais. Seu programa deve verificar se existem duas subsequências 
guais nesta sequência com tamanho pelo menos 2. O tamanho da sequência encontrada deverá ser máximo,
 se ela existir. Caso exista, seu programa deve imprimir o valor do ı́ndice i e do tamanho máximo da 
 sequência m, nesta ordem, onde i é a primeira ocorrência da sequência que possui uma cópia na sequência 
 original e m é o tamanho desta sequência que se repete. Caso contrário seu programa deve imprimir "nenhuma".

Os casos de teste não conterão entradas com mais de uma subsequência igual.

Exemplo de entrada 1:
87 9 5 4 5 5 4 6

Saı́da esperada para a entrada acima:
3 2

Exemplo de entrada 2:
12
2 7 9 5 2 5 4 8 6 2 5 4

Saı́da esperada para a entrada acima:
5 3


*)

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

(*
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

        for c:= 1 to s+1 do
        begin
            for j:= 1 to s do 
            begin
                writeln(aux[j],'----',v[j+c]);
            end;
        writeln;
        end;
        writeln('__________________________________');
    end;
end;
*)

function achaSequencia(v:vetor; s,t:longint): longint;
var 
    i: longint;
    igual : boolean;

begin
    igual := true;
    i := 1;
    while((i + s) <= t) and igual do 
    begin
        if v[i] <> v[i+s] then 
            igual := false; 
    end;

    //if igual then achaSequencia :=  else ach

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