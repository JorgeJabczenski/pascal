program aniversario;

function potencia(base,expoente : integer) : extended;
begin
    potencia := 1;
  for expoente := expoente downto 1 do
     potencia := potencia * base;
end;

function fatorial(n : integer): extended;
begin
    fatorial := 1;
    for n:=n downto 2 do
        fatorial := fatorial * n;
end;

var 
    num : integer;

begin
    read(num);
    writeln((1-(fatorial(365) / (potencia(365,num) * fatorial(365-num)))):0:2);
  
end.