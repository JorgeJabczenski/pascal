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
-1 0 -1 0 -1 0 -1 0
0 -1 0 -1 0 -1 0 -1
-1 0 -1 0 -1 0 -1 0
0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0
0 1 0 1 0 1 0 1
1 0 1 0 1 0 1 0
0 1 0 1 0 1 0 1

Saída esperada para a entrada acima:
tomar: 0
mover: 3-1 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-2 2-4 2-6 2-8

Exemplo de Entrada 2:
-1 0 -1 0 -1 0 -1 0
0 -1 0 -1 0 -1 0 -1
0 0 -1 0 -1 0 -1 0
0 -1 0 0 0 0 0 0
0 0 1 0 0 0 0 0
0 1 0 0 0 1 0 1
1 0 1 0 1 0 1 0
0 1 0 1 0 1 0 1

Saída esperada para a entrada acima:
tomar: 4-2
mover: 2-2 3-3 3-5 3-7
ficar: 1-1 1-3 1-5 1-7 2-4 2-6 2-8
}

{=================================================================================}
{                                  INICIALIZAÇÃO                                  }
{=================================================================================}

{=================================================================================}
{                                     FUNÇÕES                                     }
{=================================================================================}

{=================================================================================}
{                               PROGRAMA PRINCIPAL                                }
{=================================================================================}