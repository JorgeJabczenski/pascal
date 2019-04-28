program mastermind;

const
	tamanhoSenha = 4;
	quantidadeCores = 6;

type
	vetor = array[1..tamanhoSenha] of integer;

var
	senha, jogada                 : vetor;
	corC, corlugarC, tentativas   : integer;
	acertou                       : boolean;

procedure gerarSenha(var senha : vetor);
var
	i, c, s : integer; 
	cores   : array [1..quantidadeCores] of integer;
begin
	randomize;
	c := 1;

	for i:=1 to quantidadeCores do
		cores[i] := i;

	while c <= tamanhoSenha do 
	begin
		s := random(quantidadeCores) + 1;
		if cores[s] <> 0 then
		begin
			senha[c] := cores[s];
			c := c + 1;
			cores[s] := 0;
		end;	
	end;
	//for i := 1 to tamanhoSenha do write(senha[i],' ');
	writeln;

end;

procedure lerVetor(var v : vetor);
var i, num : integer;
begin
	for i := 1 to tamanhoSenha do 
	begin
		read(num);
		v[i] := num;
	end;		
end;

function conferirSenha(senha, jogada : vetor; var corC, corLugarC : integer) : boolean;
var
	i,j  : integer;
begin
	for i := 1 to tamanhoSenha do
		if senha[i] = jogada[i] then
			corLugarC := corLugarC + 1;

	corC := -1 * corLugarC;

	for i := 1 to tamanhoSenha do
		for j := 1 to tamanhoSenha do 
			if senha[i] = jogada[j] then corC := corC + 1;

	if corLugarC = tamanhoSenha then conferirSenha := true else conferirSenha := false;
end;

begin

	acertou := false;
	tentativas := 0;
	
	gerarSenha(senha);

	while not acertou do 
	begin
		corC := 0; corlugarC := 0; 
		tentativas := tentativas + 1;

		lerVetor(jogada);
		acertou := conferirSenha(senha, jogada,corC, corlugarC);

		writeln('Tentativa : ',tentativas);
		writeln('Cor e Lugar certo: ',corlugarC);
		writeln('Somente cor certa: ',corC);

		if not acertou then writeln('Tente novamente');
	end;
		writeln('Parabens!!! Voce levou ',tentativas,' tentativas para acertar a senha');
end.
