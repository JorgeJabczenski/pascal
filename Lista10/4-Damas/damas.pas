{=================================================================================}
{                                   ENUNCIADO                                     }
{=================================================================================}
{
Uma matriz D(8 × 8) pode representar a posiçao atual de um jogo de damas, sendo que 0 indica uma casa 
vazia, 1 indica uma casa ocupada por uma peça branca e -1 indica uma casa ocupada por uma peça preta. 
Supondo que as peças pretas estão se movendo no sentido crescente das linhas da matriz D, determinar 
as posições das peças pretas que:

• podem tomar peças brancas;
• podem mover-se sem tomar peças brancas;
• não podem se mover.

Para este exercício, considere que as peças pretas nunca estarão na última linha do jogo (dama). 
Caso não ocorra peça para algum dos movimentos possíveis exibir o valor 0 (zero) ao invés da posição.

Exemplo de Entrada 1:
-1  0 -1  0 -1  0 -1  0
 0 -1  0 -1  0 -1  0 -1
-1  0 -1  0 -1  0 -1  0
 0  0  0  0  0  0  0  0
 0  0  0  0  0  0  0  0
 0  1  0  1  0  1  0  1
 1  0  1  0  1  0  1  0
 0  1  0  1  0  1  0  1

2  2  2  2  2  2  2  2  2  2
2 -1  0 -1  0 -1  0 -1  0  2
2  0 -1  0 -1  0 -1  0 -1  2
2 -1  0 -1  0 -1  0 -1  0  2
2  0  0  0  0  0  0  0  0  2
2  0  0  0  0  0  0  0  0  2
2  0  1  0  1  0  1  0  1  2
2  1  0  1  0  1  0  1  0  2
2  0  1  0  1  0  1  0  1  2
2  2  2  2  2  2  2  2  2  2

Saída esperada para a entrada acima:
tomar: 0
mover: 3-1 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-2 2-4 2-6 2-8

Exemplo de Entrada 2:
-1  0 -1  0 -1  0 -1  0
 0 -1  0 -1  0 -1  0 -1
 0  0 -1  0 -1  0 -1  0
 0 -1  0  0  0  0  0  0
 0  0  1  0  0  0  0  0
 0  1  0  0  0  1  0  1
 1  0  1  0  1  0  1  0
 0  1  0  1  0  1  0  1  

Saída esperada para a entrada acima:
tomar: 4-2
mover: 2-2 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-4 2-6 2-8
}

{=================================================================================}
{                                  INICIALIZAÇÃO                                  }
{=================================================================================}
const
    MAX = 8;
    BORDA = 2;

 type 
    t_posicao = record 
        x,y : integer;
    end;
    t_vetor = array[0..MAX+1] of t_posicao;
    t_elemento = record
        valor : integer;
        posicao : t_posicao;
    end;
    t_matriz = array[0..MAX+1,0..MAX+1] of t_elemento;

{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

procedure criar_borda(var m : t_matriz; v : integer);
var i : integer;
begin
    for i := 0 to MAX+1 do 
    begin
        m[0][i].valor     := v;
        m[MAX+1][i].valor := v;
        m[i][0].valor     := v;
        m[i][MAX+1].valor := v;
    end;
end;

{---------------------------------------------------------------------------------}

procedure atribuir_posicoes(var m : t_matriz);
var i,j : integer;
begin
    for i := 0 to MAX+1 do 
        for j := 0 to MAX + 1 do 
        begin
            m[i][j].posicao.x := i;
            m[i][j].posicao.y := j;
        end;
end;

{---------------------------------------------------------------------------------}

procedure ler_matriz(var m : t_matriz);
var i, j : integer;
begin
    for i := 1 to MAX do
        for j := 1 to MAX do 
            read(m[i][j].valor);
end;

{---------------------------------------------------------------------------------}

procedure imprimir_matriz(m : t_matriz);
var i, j : integer;
begin
    for i := 0 to MAX + 1 do 
    begin
        for j := 0 to MAX+1 do 
            write(m[i][j].valor);
        writeln;
    end;
end;

{---------------------------------------------------------------------------------}

function determinar_estado(m : t_matriz; x,y : integer):integer;
begin
    determinar_estado := 0;

    if ((m[x+1][y-1].valor = 0) or (m[x+1][y+1].valor = 0)) then
        determinar_estado := 2;
    
    if ((m[x+1][y-1].valor = 1)) then   
        if m[x+2][y-2]. valor  = 0 then 
            determinar_estado := 1;

    if ((m[x+1][y+1].valor = 1)) then   
        if m[x+2][y+2]. valor  = 0 then 
            determinar_estado := 1;


    if (((m[x+1][y-1].valor = BORDA) or (m[x+1][y-1].valor = -1)) and ((m[x+1][y+1].valor = BORDA) or (m[x+1][y+1].valor = -1))) then
        determinar_estado := 3; 

end;


{---------------------------------------------------------------------------------}

procedure imprimir_vetores(v : t_vetor; t : integer);
var i : integer;
begin
    if t = 0 then 
        write('0')
    else 
    begin
        for i := 1 to t do 
            write(v[i].x,'-',v[i].y,' ');
    end;
    writeln;
end;

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}

var 
    tabuleiro : t_matriz;
    i, j,tamTomar, tamMover, tamFicar, estado: integer;
    tomar, mover, ficar : t_vetor;

begin
    // Inicializar variáveis
    tamTomar := 0;
    tamMover := 0;
    tamFicar := 0;

    // Criar borda 
    criar_borda(tabuleiro,BORDA);

    // Atribuir as posições às peças
    atribuir_posicoes(tabuleiro);

    // Ler o valor da Matriz
    ler_matriz(tabuleiro);

    // Para todas as peças, determinar o que cada uma pode fazer
    for i := 1 to MAX do
        for j := 1 to MAX do 
        begin
            if tabuleiro[i][j].valor = -1 then 
            begin
                estado := determinar_estado(tabuleiro,i,j);
                case estado of 
                1 : begin
                        tamTomar := tamTomar + 1;
                        tomar[tamTomar] := tabuleiro[i][j].posicao;
                    end;
                2 : begin
                        tamMover := tamMover + 1;
                        mover[tamMover] := tabuleiro[i][j].posicao;
                    end;
                3 : begin
                        tamFicar := tamFicar + 1;
                        ficar[tamFicar] := tabuleiro[i][j].posicao;
                    end;
                else 
                    writeln ('Estado Indeterminado');
                end;
            end;
        end;
    // Imprimir os Vetores das condições;
    write('tomar: ');
    imprimir_vetores(tomar, tamTomar);
    write('mover: ');
    imprimir_vetores(mover, tamMover);
    write('ficar: ');
    imprimir_vetores(ficar, tamFicar);


end.