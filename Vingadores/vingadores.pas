program vingadores;

const max = 101;

type 
     elemento = longint;
     conjunto = array [0..MAX+1] of elemento;
(* 
   Uma vez que o tipo elemento eh longint, a posicao zero do vetor (c[0])
   contera o tamanho do vetor, se os elementos fossem de outro tipo isto 
   poderia ser feito.
   Os elementos propriamente ditos iniciam na posicao 1 e terminam na posicao MAX.
   A ultima posicao (c[MAX+1]) eh utilizada como sentinela em algumas funcoes. 
*)

procedure inicializar_conjunto (var c: conjunto);
(* 
  cria as estruturas necessarias para o tipo conjunto.
  custo: constante.
*)
begin
     c[0]:= 0;
end;

function eh_vazio (var c: conjunto): boolean;
(* 
  retorna true se o conjunto c eh vazio.
  custo: constante.
*)
begin
     eh_vazio:= c[0] = 0;
end;

function cardinalidade (var c: conjunto): longint;
(* 
  retorna a cardinalidade do conjunto c 
  custo: constante.
*)
begin
     cardinalidade:= c[0];
end;

function pertence (x: elemento; var c: conjunto): boolean;
(* 
  retorna true se x pertence ao conjunto c e false caso contrario.
  como a estrutura esta ordenada é feita uma busca binária.
  custo: proporcial ao logaritmo do tamanho do conjunto, ja que ha ordenacao.
*)
var ini, fim, meio: longint;
begin
     ini:= 1;
     fim:= c[0];
     meio:= (ini + fim) div 2;
     while (ini <= fim) and (x <> c[meio]) do
     begin
          if x < c[meio] then
               fim:= meio - 1
          else
               ini:= meio + 1;
          meio:= (ini + fim) div 2;
     end;
     if x = c[meio] then
          pertence:= true
     else
          pertence:= false;
end;

procedure uniao (var c1, c2, uni: conjunto);
(* 
  obtem a uniao dos conjuntos c1 e c2. Lembrar que eles estao ordenados.
  custo: proporcial a soma dos tamanhos dos vetores (tem que percorrer os dois).
*)
var i,j,k,l: longint;
begin
     i:= 1;
     j:= 1;
     k:= 0;
     while (i <= c1[0]) and (j <= c2[0]) do
     begin
          if c1[i] < c2[j] then
          begin
               k:= k + 1;
               uni[k]:= c1[i];
               i:= i + 1;
          end
          else 
               if c1[i] > c2[j] then 
               begin
                    k:= k + 1;
                    uni[k]:= c2[j];
                    j:= j + 1;
               end
               else (* descarta um dos repetidos *)
               begin
                    k:= k + 1;
                    uni[k]:= c1[i];
                    i:= i + 1;
                    j:= j + 1;
               end;
     end; (* while *)
     (* acrescenta o que sobrou do maior conjunto *)
     for l:= i to c1[0] do
     begin
          k:= k + 1;
          uni[k]:= c1[i];
          i:= i + 1;
     end;
     for l:= j to c2[0] do
     begin
          k:= k + 1;
          uni[k]:= c2[j];
          j:= j + 1;
     end;
     uni[0]:= k;
end;

procedure intersecao (var c1, c2, intersec: conjunto);
(* 
  obtem a intersecao dos conjuntos c1 e c2. Lembrar que eles estao ordenados.
  custo: proporcional ao tamanho do vetor c1. 
  obs.: voce pode depois modificar para que o custo seja proporcional ao 
        tamanho do menor conjunto.
*)
var i,j,k: longint;
begin
     i:= 1;
     j:= 1;
     k:= 0;
     while (i <= c1[0]) and (j <= c2[0]) do
          if c1[i] < c2[j] then
               i:= i + 1
          else 
               if c1[i] > c2[j] then 
                    j:= j + 1
               else (* elemento nos dois conjuntos *)
               begin
                    k:= k + 1;
                    intersec[k]:= c1[i];
                    i:= i + 1;
                    j:= j + 1;
               end;
     intersec[0]:= k; 
end;

function contido (var c1, c2: conjunto): boolean;
(* 
  retorna true se o conjunto c1 esta contido no conjunto c2 e false caso contrario.
  custo: proporcional ao tamanho do conjunto c1.
*)
var i,j: longint;
    ok: boolean;
begin
     if c1[0] > c2[0] then
          contido:= false
     else
     begin
          ok:= true;
          i:= 1;
          j:= 1;
          while (i <= c1[0]) and (j <= c2[0] ) and ok do
               if c1[i] < c2[j] then
                    ok:= false
               else if c1[i] > c2[j] then
                    j:= j + 1
               else
               begin
                    i:= i + 1;
                    j:= j + 1;
               end;
          if not ok then
               contido:= false
          else
               if i > c1[0] then
                    contido:= true
               else
                    contido:= false;
     end;
end;

procedure inserir (x: elemento; var c: conjunto);
(* 
  insere o elemento x no conjunto c, mantem os elementos ordenados.
  custo: para garantir o conjunto ordenado, proporcional ao tamanho do conjunto.
*)
var i: longint;
begin
     if not pertence (x,c) then
     begin
          i:= c[0];
          while (i >= 1) and (x <= c[i]) do
          begin
               c[i+1]:= c[i];
               i:= i - 1;
          end;
          (* agora pode inserir x *)
          c[i+1]:= x;
          c[0]:= c[0] + 1;
     end;
end;

procedure remover (x: elemento; var c: conjunto);
(* 
  remove o elemento x do conjunto c. 
  usa uma sentinela na posicao posterior a ultima.
  custo: para garantir o conjunto ordenado, proporcional ao tamanho do conjunto.
*) 
var i, indice: longint;
begin
     (* primeiro acha a posicao do elemento *)
     indice:= 1;
     c[c[0]+1]:= x;
     while x <> c[indice] do
          indice:= indice + 1;
     if indice < c[0] + 1 then (* achou o elemento *)
     begin
          (* compacta o vetor *)
          for i:= indice to c[0]-1 do
               c[i]:= c[i+1];
          c[0]:= c[0] - 1;
     end;
end;

procedure ler_conjunto (var c: conjunto);
(* 
  cria um conjunto, a posicao zero contem o tamanho dele.
  custo: proporcional ao tamanho do conjunto.
*)
var i: longint;
    x: elemento;
begin
     read (x);
     i:= 0;
     while x <> 0 do
     begin
          inserir (x,c);
          i:= i + 1;
          read (x);
     end;
end;

procedure imprimir_conjunto (var c: conjunto);
(* 
  imprime um conjunto.
  custo: proporcional ao tamanho do conjunto
*) 
var i: longint;
begin
     for i:= 1 to c[0]-1 do
          write (c[i],' ');
     writeln (c[c[0]]); 
end;

var 
	i : longint;

	qntdHerois,qntdEquipes : longint;
	herois, equipes : array[0..MAX-1] of conjunto;
	habilidadesRequiridas, PACK : conjunto;

begin

(* 
  escreva aqui a solucao para o problema dos vingadores
*)
	qntdHerois := 0;


     writeln('Insira as os herois : ');
	ler_conjunto(herois[1]);
	i := 1;
	while not eh_vazio(herois[i]) do
	begin
		i := i + 1;
		ler_conjunto(herois[i]);
	end;
	qntdHerois :=  i - 1 ;
     writeln('numero de herois : ', qntdHerois);

     writeln('Insira as habilidades requeridas : ');
	ler_conjunto(habilidadesRequiridas);


     writeln('Insira as equipes : ');
	ler_conjunto(equipes[1]);
	i := 1;
	while not eh_vazio(equipes[i]) do 
	begin	
		i := i + 1;
		ler_conjunto(equipes[i]);
	end;
	qntdEquipes := i - 1;
     writeln('numero de equipes : ', qntdEquipes);


end.
