%Funcion para reorientar el robot pr2 hacia la lata antes de la
%manipulacion

function pr2_autoorientation_to_waypoint(siguiente_waypoint)

    %%%%%%%%%%%%%%%%%%%%% DESGLOSE DEL WAYPOINT %%%%%%%%%%%%%%%%%%%%%%%%%%%

    posicion_waypoint_x = siguiente_waypoint(1, 1);
    posicion_waypoint_y = siguiente_waypoint(1, 2);
    posicion_waypoint_2D = [posicion_waypoint_x posicion_waypoint_y];

    %%%%%%%%%%%%%%%%%%% DECLARAR PUBLISHER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    vel_pub = rospublisher('/base_controller/command');
    vel_msg = rosmessage(vel_pub);

    %%%%%% Declaración necesaria para la obtencion de la posicion y orientacion del robot.

    gazebo = ExampleHelperGazeboCommunicator();
    kobuki = ExampleHelperGazeboSpawnedModel('pr2',gazebo);

    orientacion_relativa = 90; %Valor inicial cualquiera.
    signo = -1;
    
    while orientacion_relativa > 1 || orientacion_relativa < -1

        %%%%%% Obtencion de posicion y orientacion del robot.

        [position_robot_3D, orientation] = getState(kobuki);

        orientacion_robot = orientation(1, 1);

        posicion_robot_x = position_robot_3D(1, 1);
        posicion_robot_y = position_robot_3D(1, 2);
        posicion_robot_2D = [posicion_robot_x posicion_robot_y];
        
        %%%%%% Calculo de la distancia angular al punto de destino.
        
%         angulo_anterior = orientacion_relativa;
        
        orientacion_relativa = rad2deg(orientation_rad_J(posicion_robot_2D, posicion_waypoint_2D)) - orientacion_robot;
        
%         angulo_actual = orientacion_relativa;
        
         %%%%%% Obtencion del sentido de giro.
        
%         if abs(angulo_anterior) < abs(angulo_actual)
%             signo = 1;
%         end

        %%%%%% Asignacion y publicacion de la velocidad angular.
        
%         vel_msg.Angular.Z = signo * 0.5 * orientation_rad_J(posicion_robot_2D, posicion_waypoint_2D);
        vel_msg.Angular.Z = 4 * atan2((posicion_waypoint_y - posicion_robot_y) , (posicion_waypoint_x - posicion_robot_x));


        send(vel_pub,vel_msg);

        disp(orientacion_relativa)
        %disp(rad2deg(orientation_rad_J(posicion_robot_2D, posicion_lata_2D)))
        %disp(orientacion_robot)
    end

    disp('Objetivo fijado!')
end