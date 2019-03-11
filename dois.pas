program dois;

var
	count, soma, limite,i: integer;

begin
	count := 0;
	soma := count;
	writeln('Numero: ');
	read (limite);

	for i:= 10 to 100 do writeln(i);

	while count < limite do
	begin
		count := count + 1;
		soma := soma + count;
		writeln(soma);
	end;
end.