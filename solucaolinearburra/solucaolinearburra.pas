program solucaolinearburra;

var
    a11, a12, b1, a21, a22, b2: single;
    aux1, nx, ny, save1, save2, save3: single;

begin
    read (a11,a12,b1, a21,a22, b2);
    writeln(a11:0:3,' ',a12:0:3,' ',b1:0:3,' ', a21:0:3,' ',a22:0:3,' ', b2:0:3);
    writeln('');

    save1 := a11;
    save2 := a12;
    save3 := b1;
    
    a11 := a11 * a21;
    a12 := a12 * a21;
    b1  := b1  * a21;  

    a21 := a21 * save1;
    a22 := a22 * save1;
    b2  := b2  * save1;

    writeln(a11:0:3,' ',a12:0:3,' ',b1:0:3,' ', a21:0:3,' ',a22:0:3,' ', b2:0:3);
    writeln('');
    

    a21 := a12 - a21;
    a22 := a12 - a22;
    b2  := b1  - b2;


    writeln(a11:0:3,' ',a12:0:3,' ',b1:0:3,' ', a21:0:3,' ',a22:0:3,' ', b2:0:3);
    writeln('');

    ny := b2 / a22;
    nx := (save3 - save2 * ny) / save1;

    writeln('x = ',nx:0:3);
    writeln('y = ',ny:0:3);
    
end.