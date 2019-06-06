(*
Pra fazer : 
    - Fazer as funções LerJogada e VerSeAcabou
    - Pensar em como implementar o Inunda com a pilha (visto em sala mas não lembro)

Lembretes (Vagas lembraças da aula)
    cor_velha, cor_nova

*)

program hehe;
uses CRT;

const MAX = 64;

type
    t_jogo = record
        tabuleiro : array [0..MAX+1,0..MAX+1] of integer;
        n_jogadas,tamanho,cores,maxJogadas : integer;
        acabou,ganhou : boolean;

    end;

    t_elementoPilha = record
        x,y : integer;
    end;

    t_pilha = record
        pilha : array[1..MAX] of t_elementoPilha;
        topo : integer;
    end;

var 
    jogo : t_jogo;

(*===================================================================*)
(*=                         FUNÇÕES DA PILHA                        =*)
(*===================================================================*)

function p_vazia (var p : t_pilha) : boolean; 
begin
    p_vazia := p.topo = 0;
end;

procedure p_inicializa(var p : t_pilha); 
begin
    p.topo := 0;
end;

procedure push(var p : t_pilha; e : t_elementoPilha); 
begin
    p.topo := p.topo + 1;
    p.pilha[p.topo] := e;
end;

function pop(var p : t_pilha) : t_elementoPilha; 
begin
    pop := p.pilha[p.topo];
    p.topo := p.topo - 1;
end;

(*===================================================================*)
(*=                         FUNÇÕES DO JOGO                         =*)
(*===================================================================*)

procedure gerarTabuleiro(var jogo : t_jogo);
var 
    i,j : integer;
begin
    randomize;
    for i := 1 to jogo.tamanho do 
        for j := 1 to jogo.tamanho do 
            jogo.tabuleiro[i][j] := random(jogo.cores) + 1;
end;

procedure inicializar_jogo(var jogo : t_jogo);
begin
    write('Qual o tamanho do tabuleiro ? : ');
    readln(jogo.tamanho);
    write ('Quantidade de cores ?  : ');
    readln(jogo.cores);
    write ('Qual o maximo de jogadas?  : ');
    readln(jogo.maxJogadas);

    gerarTabuleiro(jogo);     // Gera um tabuleiro aleatório
    
    jogo.acabou := false;     // Controla o loop principal do jogo
    jogo.ganhou := false ;    // Alterado para true no verSeAcabou caso o jogador tenha ganho
    jogo.n_jogadas := 0;
end;

procedure lerJogada();
begin
    
end;
procedure inundar(var jogo : t_jogo);
begin
    
end;
procedure imprimirTabuleiro(var jogo : t_jogo);
var 
    i,j : integer;
begin
    for i := 1 to jogo.tamanho do 
    begin
        for j := 1 to jogo.tamanho do 
        begin
            textbackground(jogo.tabuleiro[i][j]);
            write (' ', jogo.tabuleiro[i][j]);
        end;
        textbackground(black);
        writeln;
    end;
end;

function verSeAcabou(var jogo : t_jogo) : boolean;
begin
    verSeAcabou := false;   
end;

(*===================================================================*)
(*=                      PROGRAMA PRINCIPAL                         =*)
(*===================================================================*)

begin
    inicializar_jogo(jogo);

    while not jogo.acabou do 
    begin
        lerJogada();
        inundar(jogo);
        imprimirTabuleiro(jogo);
        jogo.acabou := verSeAcabou(jogo);
    end;

    if jogo.ganhou then
        writeln('Parabens Voce Ganhou!') 
    else
        writeln('Parbens Voce Perdeu!!!!');

end.