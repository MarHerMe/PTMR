%Funcion para reorientar el robot pr2 hacia la lata antes de la
%manipulacion

rosinit('192.168.184.129');

    %%%%%%%%%%%%%%%%%%%%% DECLARAR LATA %%%%%%%%%%%%%%%%%%%%%%%%%%%%

    posicion_lata_3D = [-1.55 -2.3 0.55];
    
    pr2_autoorientation_to_waypoint(posicion_lata_3D);
    
rosshutdown;