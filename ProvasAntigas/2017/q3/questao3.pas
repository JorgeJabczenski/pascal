program questao3;

var  
    num, planaltos, anterior, vale: integer;

begin 
    planaltos := 0;
    read(num);
    anterior := num;
    vale := num;

    read(num);

    while(num <> 0) do 
    begin
        if (num <> anterior) then
        begin
            if num  > anterior then 
                vale := 1
            else
                vale := 0;


        end;


    anterior := num;
    read(num);

    end; // end while

end.