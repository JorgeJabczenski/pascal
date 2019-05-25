program interpretador;
Uses sysutils;

type
    codigo = array[1..50] of string[50];

procedure traduzirInstrucao(var e,s : string);
begin
    if AnsiSameStr(e[1..3],'add') then s := s +'0';
    if AnsiSameStr(e[1..3],'sub') then s := s +'1';
    if AnsiSameStr(e[1..3],'mul') then s := s +'2';
    if AnsiSameStr(e[1..3],'and') then s := s +'3';
    if AnsiSameStr(e[1..3],'oor') then s := s +'4';
    if AnsiSameStr(e[1..3],'xor') then s := s +'5';
    if AnsiSameStr(e[1..3],'slt') then s := s +'6';
    if AnsiSameStr(e[1..3],'not') then s := s +'7';
    if AnsiSameStr(e[1..3],'adi') then s := s +'8';
    if AnsiSameStr(e[1..3],'lod') then s := s +'9';
    if AnsiSameStr(e[1..3],'sto') then s := s +'a';
    if AnsiSameStr(e[1..3],'sho') then s := s +'b';
    if AnsiSameStr(e[1..3],'jal') then s := s +'c';
    if AnsiSameStr(e[1..3],'jre') then s := s +'d';
    if AnsiSameStr(e[1..3],'beq') then s := s +'e';
    if AnsiSameStr(e[1..3],'hlt') then s := s +'f';
end;

procedure traduzirRegistradores(var e,s : string);
begin
    s := s + e[5] + e[7] + e[9];
end;

procedure traduzirConst(var e,s : string);
var v : integer;
begin
    val(e[9],v);
    s := s + IntToHex(v,4);
end;


var 
    tamanhoCodigo, a,b,c,i : integer;
    entrada, saida : codigo;
    linha ,e,s: string[50];

begin
    
    writeln('Quantas linhas tem seu codigo?');
    read(tamanhoCodigo);  

    for i := 1 to tamanhoCodigo + 1 do 
        readln(entrada[i]); 

    for i := 1 to tamanhoCodigo + 1 do 
    begin
        traduzirInstrucao(entrada[i], saida[i]);
        traduzirRegistradores(entrada[i], saida[i]);
        traduzirConst(entrada[i], saida[i]);
        writeln(saida[i]);
    end;


end.