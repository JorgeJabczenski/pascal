program solucaolinear;

var
    a11, a12, b1, a21, a22, b2: single;
    det, det1, det2: single;

begin
    read (a11,a12,b1, a21,a22, b2);

    det  := (a11 * a22) - (a12* a21);
    det1 := (b1  * a22) - (a12* b2 );
    det2 := (a11 * b2 ) - (b1 * a21);

    writeln('x = ', det1/det:0:3);
    writeln('y = ', det2/det:0:3);

end.