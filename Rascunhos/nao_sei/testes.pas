program Dados;
const
	MAX = 100;
type
	pessoa =  record	
		telefone : qword;
		nome : array [1..MAX] of string;
		endereco : array [1..MAX] of string;
	end;
	v_pessoas = array[1..MAX] of pessoa;	
var
	clientes : v_pessoas;
begin
	
	
end.
