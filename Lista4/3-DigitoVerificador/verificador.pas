program verif;

var
  i, soma, num, verificador : longint;
begin
 soma := 0;
  
    read(num);
     
    verificador:= num mod 10;
    num := num div 10;

  for i:= 2 to 9 do
  begin
    writeln((num mod 10));
    soma := ((num mod 10)  * i) + soma;
    num := num div 10;
    //writeln(soma);
  end;
  
  if (verificador = (soma mod 10)) then 
   writeln('SIM')
  else
    writeln('NAO');
end.
