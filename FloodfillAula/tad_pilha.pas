unit tad_pilha;

interface

CONST MAX = 100000;

TYPE
     coordenada = record
          x, y: integer;
     end;
     elemento = coordenada;
     pilha = record
          ini: longint;
          v: array [1..MAX] of elemento;
     end;

procedure inicializa_pilha (var p: pilha);
(* inicializa a estrutura *)

function tamanho_pilha (p: pilha): longint;
(* retorna o numero de elementos da pilha *)

function pilha_vazia (p: pilha): boolean;
(* retorna true se a pilha esta vazia *)

procedure empilha (x: elemento; var p: pilha);
(* insere x no inicio da pilha *)

function desempilha (var p: pilha): elemento;
(* retorna o elemento do inicio da pilha e o remove dela *)

function topo (p: pilha): elemento;
(* retorna o elemento do inicio da pilha, sem remove-lo *)

implementation

procedure inicializa_pilha (var p: pilha);
(* inicializa a estrutura *)
begin
     p.ini:= 0;
end;

function tamanho_pilha (p: pilha): longint;
(* inicializa a estrutura *)
begin
     tamanho_pilha:= p.ini;
end;

function pilha_vazia (p: pilha): boolean;
begin
     pilha_vazia:= p.ini = 0; 
end;

procedure empilha (x: elemento; var p: pilha);
begin
     if p.ini < MAX then
     begin
          p.ini:= p.ini + 1;
          p.v[p.ini]:= x;      
     end
     else
     begin
          writeln ('pilha cheia, elemento nao inserido');
          writeln (x.x,' ',x.y);
     end;
end;

function desempilha (var p: pilha): elemento;
begin
     if pilha_vazia (p) then
          writeln ('pilha vazia, elemento nao removido')
     else
     begin
          desempilha:= p.v[p.ini];
          p.ini:= p.ini - 1;
     end;
end;

function topo (p: pilha): elemento;
begin
     if pilha_vazia (p) then
          writeln ('pilha vazia, elemento nao existe')
     else
          topo:= p.v[p.ini];
end;

end.
