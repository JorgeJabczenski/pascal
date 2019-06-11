(*
Pra fazer : 
    - Fazer as funções LerJogada e VerSeAcabou
    - Pensar em como implementar o Inunda com a pilha (visto em sala mas não lembro)
    - Melhorar funções da pilha
    - Limpar a tela entre jogadas
    - Botar o contador de jogadas no imprimeTela

Lembretes (Vagas lembraças da aula)
    cor_velha, cor_nova

*)

program hehe;
uses CRT;

const MAX = 1000;

type
    t_jogo = record
        tabuleiro : array [0..MAX+1,0..MAX+1] of integer;
        n_jogadas,tamanho,cores,maxJogadas,cor_nova, cor_velha : integer;
        acabou,ganhou,podeInundar : boolean;

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
            jogo.tabuleiro[i][j] := random(jogo.cores)+1;
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
    jogo.cor_velha := jogo.tabuleiro[1][1];
end;

procedure lerJogada(var jogo : t_jogo);
begin
    jogo.podeInundar := false;
    read(jogo.cor_nova);
    if jogo.cor_nova <> jogo.tabuleiro[1][1] then
    begin
        jogo.n_jogadas := jogo.n_jogadas + 1;
        jogo.podeInundar := true;
    end; 
end;

procedure inundar(var jogo : t_jogo);
var 
    p : t_pilha;
    e : t_elementoPilha;
begin
    e.x := 1;
    e.y := 1;
    jogo.cor_velha := jogo.tabuleiro[1][1];
    jogo.tabuleiro[1][1] := jogo.cor_nova;

    p_inicializa(p);
    push(p,e);

    while not p_vazia(p) do 
    begin
        e := pop(p);

        e.x := e.x - 1;
        if (jogo.tabuleiro[e.x][e.y] = jogo.cor_velha) then
        begin
            jogo.tabuleiro[e.x][e.y] := jogo.cor_nova;
            push(p,e);
        end;

        e.x := e.x + 2;
        if (jogo.tabuleiro[e.x][e.y] = jogo.cor_velha) then
        begin
            jogo.tabuleiro[e.x][e.y] := jogo.cor_nova;
            push(p,e);
        end;

        e.x := e.x - 1;
        e.y := e.y + 1;
        if (jogo.tabuleiro[e.x][e.y] = jogo.cor_velha) then
        begin
            jogo.tabuleiro[e.x][e.y] := jogo.cor_nova;
            push(p,e);
        end;

        e.y := e.y - 2;
        if (jogo.tabuleiro[e.x][e.y] = jogo.cor_velha) then
        begin
            jogo.tabuleiro[e.x][e.y] := jogo.cor_nova;
            push(p,e);
        end;


    end;

    if jogo.cor_nova <> jogo.cor_velha then
    begin
        
    end;
end;

procedure imprimirTabuleiro(var jogo : t_jogo);
var 
    i,j : integer;
begin
    clrscr;
    writeln(jogo.n_jogadas,' / ',jogo.maxJogadas);
    for i := 1 to jogo.tamanho do 
    begin
        for j := 1 to jogo.tamanho do 
        begin
            textbackground(jogo.tabuleiro[i][j]);
            //textcolor(jogo.tabuleiro[i][j]);
            write (' ', jogo.tabuleiro[i][j]);
        end;
        textbackground(black);
        writeln;
    end;
end;

function verSeAcabou(var jogo : t_jogo) : boolean;
var i,j : integer;
begin
    verSeAcabou := true;
    for i := 1 to jogo.tamanho do 
        for j := 1 to jogo.tamanho do 
            if jogo.tabuleiro[i][j] <> jogo.tabuleiro[1][1] then
                verSeAcabou := false;

    if verSeAcabou then 
        jogo.ganhou := true
    else
        if (jogo.n_jogadas >= jogo.maxJogadas) then 
            begin
                verSeAcabou := true;
                jogo.ganhou := false;
            end;
end;

(*===================================================================*)
(*=                      PROGRAMA PRINCIPAL                         =*)
(*===================================================================*)

begin
   Sound(1000);
   Sound(500);
   Delay(1000);
   Sound(300);
   Sound(150);
   Delay(1000);
   NoSound;
    inicializar_jogo(jogo);
    imprimirTabuleiro(jogo);

    while not jogo.acabou do 
    begin
        lerJogada(jogo);
        if jogo.podeInundar then inundar(jogo);
        imprimirTabuleiro(jogo);
        jogo.acabou := verSeAcabou(jogo);
    end;

    if jogo.ganhou then
        writeln('Parabens Voce Ganhou!')    
    else
        writeln('Parbens Voce Perdeu!!!!');

end.