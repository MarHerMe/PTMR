function rad=orientation_rad_J(punto1, punto2)

x=punto2(1)-punto1(1);
y=punto2(2)-punto1(2);
pi=3.141592;

if x==0
    if y>0
        rad=pi/2;
    else
        rad=-pi/2;
    end
elseif x>0
    rad=atan(y/x);
else
    if y>0
        rad=atan(y/x)+pi;
    else
        rad=atan(y/x)-pi;
    end
end
end