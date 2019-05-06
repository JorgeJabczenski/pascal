program q1;
const
    MAX = 100;
type 
    TpVetor =  array[1..MAX] of integer;

var 
    v : TpVetor;
    tam,pos,num,i : integer;

procedure gerarVetor(var v :TpVetor; tam : integer);
var i : integer;
begin
    randomize;
    for i := 1 to tam do 
        v[i] := random(50);
end;

procedure remove(var v : TpVetor; var tam : integer; pos,num : integer);
var i : integer;
begin
    if (pos + num) > tam then writeln('IMPOSSIVEL REMOVER, CANCELANDO PROCEDIMENTO!')
    else
    begin
        for  i := 1 to num do 
        begin
            v[pos] := v[pos+num];
            pos := pos + 1;
            tam := tam - 1;
        end;
    end;        
end;

begin
    write('Entre com o tamanho do vetor : ');
    readln(tam);
    write('Entre com a posicao inicial a ser removida: ');
    readln(pos);
    write('Entre com quantos numeros voce quer retirar: ');
    readln(num);
    
    gerarVetor(v,tam);
    for i := 1 to tam do 
        write(v[i], ' ');
    writeln;

    remove(v,tam,pos,num);
    writeln;
    for i := 1 to tam do 
        write(v[i], ' ');
    writeln;
end.
