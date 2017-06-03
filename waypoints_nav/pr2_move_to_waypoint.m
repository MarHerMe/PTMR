function pr2_move_to_waypoint(siguiente_waypoint)

    %%%%%%%%%%%%%%%%%%%% TOLERANCIA DE DISTANCIA %%%%%%%%%%%%%%%%%%%%%%%%%%

    distancia_cerca = 0.2;
    
    %%%%%%%%%%%%%%%%%%%%% DESGLOSE DEL WAYPOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%

    posicion_waypoint_x = siguiente_waypoint(1, 1);
    posicion_waypoint_y = siguiente_waypoint(1, 2);

    %%%%%%%%%%%%%%%%%%% DECLARAR PUBLISHER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    vel_pub = rospublisher('/base_controller/command');
    vel_msg = rosmessage(vel_pub);

    %%%%%% Declaración necesaria para la obtencion de la posicion y orientacion del robot.

    gazebo = ExampleHelperGazeboCommunicator();
    kobuki = ExampleHelperGazeboSpawnedModel('pr2',gazebo);
    
    distancia_punto = 100; %%%%%% Valor inicial cualquiera.

    while distancia_punto > distancia_cerca

        %%%%%% Obtencion de posicion y orientacion del robot.

        position_robot_3D = getState(kobuki);

        posicion_robot_x = position_robot_3D(1, 1);
        posicion_robot_y = position_robot_3D(1, 2);
        
        %%%%%% Calculo de la distancia al punto de destino.

        distancia_punto = distance(posicion_robot_x, posicion_robot_y, posicion_waypoint_x, posicion_waypoint_y);
        
        %%%%%% Asignacion y publicacion de la velocidad lineal.

        vel_msg.Linear.X = 8 * distancia_punto;

        send(vel_pub,vel_msg);

        disp(distancia_punto)
    end
end