%Funcion que obtiene las cooredenadas de los puntos de la ruta desde el
%servidor de parametros de ROS.

function waypoints = getWaypoints
    
    ptree = rosparam;

    num_waypoints = get(ptree, '/num_waypoints');
    
    waypoints = zeros (num_waypoints , 2);

    for i = 1:num_waypoints
        x = strcat('/waypoints/point_',num2str(i),'/x');
        waypoints(i, 1) = get(ptree, x);
        
        y = strcat('/waypoints/point_',num2str(i),'/y');
        waypoints(i, 2) = get(ptree, y);
        
    end

end