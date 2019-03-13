program convert;
var 
	num:integer;
	base, result,modulo:integer;

begin
	(*read(num);
	read(base);
	while (num/base) >= 0 do
	begin
		write((num)mod(base));
		num := int (num / base);
	end;
	*)
	read(num);
	read(base);
	result := int(num/base);
	modulo := (num)mod(base);


	writeln(result);
	writeln(modulo);
end.
