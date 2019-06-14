program eqLinearesComMatriz;
const
    MAX = 100;
type
    t_matriz = array[1..MAX, 1..MAX] of real;
    t_vetor  = array[1..MAX] of real; 

function calcularDeterminante(m : t_matriz) : real;
begin
    
end;


var 
    matriz : t_matriz;
    resultado,ladoDireito : t_vetor;
    linhas, colunas : integer;
    

{ > Programa Principal < }
begin

    {ler tamanho da matriz}
    read(linhas, colunas);
    ler_resultados(resultado,colunas);
    ler_matriz(matriz);
    ler_resultados(ladoDireito,linhas);

    calcular_determinante(matriz,ladoDireito)

end.