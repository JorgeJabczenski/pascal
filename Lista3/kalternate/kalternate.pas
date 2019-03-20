program ehkalternate;

var
    k, num, count : cardinal;
    modulo, nao : boolean;

begin
    count := 0;
    nao := false;
    read(k);
    read(num);
    modulo := odd(num);
    writeln('numero: ',num, '  modulo: ',modulo);
    while num > 0 do
    begin
        count := count + 1;

        if count = k then
        begin
            count := 0;
            modulo := not(modulo);
        end; // end if

        read (num);
        if odd(num) <> modulo then
        begin
            writeln('Nao eh k-alternante');
            
            nao := true;
            break;
        end; // end if
    writeln('numero: ',num, '  modulo: ',modulo, '  count: ',count);
    end; // end while

    if not(nao) then
        writeln('Sim eh k-alternante');
end.

(*
program kalternate;

var
	k, num, falso, modulo, moduloa : integer;
begin

	count := 0;
	falso := 0;


	read(k);
	read(num);

	moduloa := num mod 2;

	while(num <> 0) do
	begin
		count := count + 1;
		modulo := num mod 2;

		if count = k then
		begin
		count := 0;
			if moduloa = 0 then
				moduloa := 1;
			if moduloa = 1 then
				moduloa := 0;
		end; // end if

		if moduloa <> modulo then
		begin
			writeln('NAO');
			falso := 1;
			break;
		end; // end if

		moduloa := modulo;
		read(num);
	end; // end while

	if (falso = 0) then
		writeln('SIM');
end.


*)
