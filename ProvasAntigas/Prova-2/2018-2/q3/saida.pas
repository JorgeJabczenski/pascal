program Q4;

var
    a , b : integer ;
    c : real ;

function f1 ( n1 : integer ; var n2 : integer ) : real ;

begin
    while n1 < n2 do
        n1:= n1 + 4 ;
    n2:= n2 + 245 div 10;
    f1:= n2 / n1 ;
end ;

procedure p1 (var a : integer ; var b : real ) ;
var
    c : integer ;
begin
    c:= a + 2 ;
    b:= f1 ( 8 , c ) ;
    if a < b then
        a:= round ( b )
    else
        a :=  a - 5;
end;

begin
    a:= 10;
    b:= 20;
    c:= 1.5 ;
    writeln ( f1 ( a , b ):0:0 ,' ', a ,' ', b ) ;
    p1 ( a , c ) ;
    writeln ( a ,' ', c:0:3) ;
end.