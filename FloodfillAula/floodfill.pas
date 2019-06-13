program floodfill;

USES CRT, tad_pilha;

const
     GANHOU = 1;
     NAO_ACABOU = 2; 
     PERDEU = 3;
     MAX = 30;
     COR_FALSA = -1;

type 

     tipo_jogo = record
          matriz:  array[0..MAX+1,0..MAX+1] of integer;
          tam, num_jogadas, max_jogadas, num_cores, estado_jogo: integer;
     end;
//------------------------------------------------------------------------------
function ler_cor (jogo: tipo_jogo): integer;
     var cor: integer;
     begin
          repeat
               read (cor);
          until (cor >= 1) and (cor <= jogo.num_cores);
          ler_cor:= cor;
     end;

     var
          jogo: tipo_jogo;
//------------------------------------------------------------------------------
procedure ler_conf_tabuleiro (var jogo: tipo_jogo);
     begin
          write ('Num. cores: ');
          read (jogo.num_cores);
          write ('tam tabuleiro: ');
          read (jogo.tam);
          write ('Max Jogadas: ');
          read (jogo.max_jogadas);
     end;
//------------------------------------------------------------------------------
procedure iniciar_jogo(var jogo: tipo_jogo);
     var i,j: integer;
     begin
          randomize;
          for i:=1  to jogo.tam do
               for j:= 1 to jogo.tam do
                    jogo.matriz[i,j]:= random(jogo.num_cores) + 1;
          jogo.estado_jogo:= NAO_ACABOU;
          jogo.num_jogadas:= 0; 
          (* criar a borda *)
          for i:= 0 to jogo.tam + 1 do
          begin
               jogo.matriz[0,i]:= 0;
               jogo.matriz[jogo.tam+1,i]:= 0;
               jogo.matriz[i,0]:= 0;
               jogo.matriz[i,jogo.tam+1]:= 0;
          end;
     end;
//------------------------------------------------------------------------------
procedure imprimir_jogo (jogo: tipo_jogo);
     var i,j: integer;
     begin
          clrscr;
          writeln (jogo.num_jogadas,'/',jogo.max_jogadas);
          writeln;
          for i:=1  to jogo.tam do
          begin
               for j:= 1 to jogo.tam do
               begin
                    textbackground (jogo.matriz[i,j]);
                    write (jogo.matriz[i,j],' ');
               end;
               writeln;
          end;
          textbackground (black);
     end;
//------------------------------------------------------------------------------
function acabou (jogo: tipo_jogo): integer;
     begin
          acabou:= jogo.estado_jogo;
     end;
//------------------------------------------------------------------------------
function inunda_vizinho (var jogo: tipo_jogo;cor_velha,cor_nova,x,y: integer): boolean;
     begin
               inunda_vizinho:= false;
               if jogo.matriz[x,y] = cor_velha then
               begin
                    jogo.matriz[x,y]:= cor_nova;
                    inunda_vizinho:= true;
               end;
     end;
//------------------------------------------------------------------------------
function testa_vitoria (jogo: tipo_jogo): boolean;
     var i,j: integer;
         ok: boolean;
     begin
          ok:= true;
          i:= 1;
          while (i <= jogo.tam) and ok do
          begin
               j:= 1;
               while (j <= jogo.tam) and ok do
               begin
                    if jogo.matriz[i,j] <>  jogo.matriz[1,1] then
                         ok:= false;
                    j:= j + 1;
               end;
               i:= i + 1;
          end;
          testa_vitoria:= ok;
     end;
//------------------------------------------------------------------------------
procedure inunda(var jogo: tipo_jogo;cor_nova: integer);
     var p: pilha;
         e: elemento;
         cor_velha: integer;
     begin
          jogo.num_jogadas:= jogo.num_jogadas + 1;
          inicializa_pilha(p);
          e.x:= 1;
          e.y:= 1;
          cor_velha:= jogo.matriz[1,1];
          jogo.matriz[1,1]:= cor_nova;
          empilha(e,p);
          while not pilha_vazia(p) do
          begin
               e:= desempilha(p);
               e.x:= e.x - 1;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
                    empilha (e,p);
               e.x:= e.x + 2;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
                    empilha (e,p);
               e.x:= e.x - 1;
               e.y:= e.y - 1;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
                    empilha (e,p);
               e.y:= e.y + 2;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
                    empilha (e,p);
          end; 
          if testa_vitoria(jogo) then
               jogo.estado_jogo:= GANHOU
          else if jogo.num_jogadas > jogo.max_jogadas then
               jogo.estado_jogo:= PERDEU;
     end;
//------------------------------------------------------------------------------
function distancia (e1,e2: elemento): real;
     begin
          distancia:= sqrt((e2.x - e1.x)*(e2.x - e1.x) + (e2.y - e1.y)*(e2.y - e1.y));
     end;
//------------------------------------------------------------------------------
function sorteia_cor (jogo: tipo_jogo;cor_velha: integer): integer;
     var cor: integer;
     begin
          repeat
               cor:= random (jogo.num_cores) + 1;
          until cor <> cor_velha; 
          sorteia_cor:= cor;
     end;
//------------------------------------------------------------------------------
function escolhe_cor (jogo: tipo_jogo): integer;
     var e,destino: elemento;
         p: pilha;
         cor_velha, cor_nova: integer;
         menor_dist: elemento;
     begin
          cor_nova:= COR_FALSA;
          destino.x:= jogo.tam;
          destino.y:= jogo.tam;
          menor_dist.x:= 1;
          menor_dist.y:= 1;
          inicializa_pilha(p);
          e.x:= 1;
          e.y:= 1;
          cor_velha:= jogo.matriz[1,1];
          jogo.matriz[1,1]:= cor_nova;
          empilha(e,p);
          while not pilha_vazia(p) do
          begin
               e:= desempilha(p);
               e.x:= e.x - 1;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
               begin
                    empilha (e,p);
                    if distancia (e,destino) < distancia (menor_dist,destino) then
                         menor_dist:= e;
               end;
               e.x:= e.x + 2;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
               begin
                    empilha (e,p);
                    if distancia (e,destino) < distancia (menor_dist,destino) then
                         menor_dist:= e;
               end;
               e.x:= e.x - 1;
               e.y:= e.y - 1;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
               begin
                    empilha (e,p);
                    if distancia (e,destino) < distancia (menor_dist,destino) then
                         menor_dist:= e;
               end;
               e.y:= e.y + 2;
               if inunda_vizinho (jogo,cor_velha,cor_nova,e.x,e.y) then
               begin
                    empilha (e,p);
                    if distancia (e,destino) < distancia (menor_dist,destino) then
                         menor_dist:= e;
               end;
          end; 
          escolhe_cor:= sorteia_cor (jogo,cor_velha);
          if jogo.matriz[menor_dist.x,menor_dist.y+1] <> 0 then
               escolhe_cor:= jogo.matriz[menor_dist.x,menor_dist.y+1]
          else if jogo.matriz[menor_dist.x+1,menor_dist.y] <> 0 then
               escolhe_cor:= jogo.matriz[menor_dist.x+1,menor_dist.y];
          if escolhe_cor = cor_velha then
               escolhe_cor:= sorteia_cor (jogo,cor_velha);
     end;
//------------------------------------------------------------------------------
function inunda_vizinho_falso (var jogo: tipo_jogo;cor_velha,cor_nova,x,y: integer): boolean;
     begin
               inunda_vizinho_falso:= false;
               if jogo.matriz[x,y] = cor_velha then
               begin
                    jogo.matriz[x,y]:= cor_nova;
                    inunda_vizinho_falso:= true;
               end;
     end;

function inunda_falso(jogo : tipo_jogo; cor : integer) : integer;
     var
          p: pilha;
          e: elemento;
          cor_velha: integer;
     begin
          inunda_falso := 0;
          jogo.num_jogadas:= jogo.num_jogadas + 1;
          inicializa_pilha(p);
          e.x:= 1;
          e.y:= 1;
          cor_velha:= jogo.matriz[1,1];
          jogo.matriz[1,1]:= cor;
          empilha(e,p);
          while not pilha_vazia(p) do
          begin
               e:= desempilha(p);
               e.x:= e.x - 1;
               if inunda_vizinho_falso (jogo,cor_velha,cor,e.x,e.y) then
               begin
                    empilha (e,p);
                    inunda_falso := inunda_falso + 1;
               end;

               e.x:= e.x + 2;
               if inunda_vizinho_falso (jogo,cor_velha,cor,e.x,e.y) then
               begin
                    empilha (e,p);
                    inunda_falso := inunda_falso + 1;
               end;

               e.x:= e.x - 1;
               e.y:= e.y - 1;
               if inunda_vizinho_falso (jogo,cor_velha,cor,e.x,e.y) then
               begin
                    empilha (e,p);
                    inunda_falso := inunda_falso + 1;
               end;

               e.y:= e.y + 2;
               if inunda_vizinho_falso (jogo,cor_velha,cor,e.x,e.y) then
               begin
                    empilha (e,p);
                    inunda_falso := inunda_falso + 1;
               end;
          end; 
     end;

function melhor_jogada(jogo : tipo_jogo) : integer;
     var 
          maior,i,teste : integer;
     begin
          maior := 0;
          melhor_jogada := 0;
          for i := 1 to jogo.num_cores do 
          begin
               if jogo.matriz[1,1] <> i then 
               begin
                    teste := inunda_falso(jogo,i);
                    writeln('Se jogar a cor ',i,' voce vai inundar ',teste);
                    if teste > maior then
                    begin
                         maior := teste;
                         melhor_jogada := i;
                    end;
               end;
          end;
          if melhor_jogada = 0 then
          begin
               while melhor_jogada <> jogo.matriz[1,1] do 
               begin
                    melhor_jogada := random(jogo.num_cores)+1;
               end;
          end;
     end;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
begin
     randomize;
     ler_conf_tabuleiro(jogo);
     iniciar_jogo(jogo);
     repeat
          delay (200);
          imprimir_jogo(jogo);
          inunda(jogo,melhor_jogada(jogo));
     until acabou(jogo) <> NAO_ACABOU; 
     
     imprimir_jogo(jogo);
     
     if acabou(jogo) = GANHOU then
          writeln ('Parabens voce ganhou')
     else
          writeln ('Jogue novamente');
end.
