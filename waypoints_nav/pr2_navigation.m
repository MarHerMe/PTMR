rosinit('192.168.184.129');

%%%%%%%%%%%%%%%%%%%%% RECOGER BRAZOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%% Punto de recogida de los brazos

tjPointC = rosmessage('trajectory_msgs/JointTrajectoryPoint');
tjPointC.Positions = [0.0 -1.0 0.0 -1.5 0.0 0.0 0.0];
tjPointC.Velocities = zeros(1,7);
tjPointC.TimeFromStart = rosduration(2.0);

%%%%%%% Declaracion brazo derecho

[rArm, rGoalMsg] = rosactionclient('r_arm_controller/joint_trajectory_action');
waitForServer(rArm);

rGoalMsg.Trajectory.JointNames = {'r_shoulder_pan_joint', ...
                                   'r_shoulder_lift_joint', ...
                                   'r_upper_arm_roll_joint', ...
                                   'r_elbow_flex_joint',...
                                   'r_forearm_roll_joint',...
                                   'r_wrist_flex_joint',...
                                   'r_wrist_roll_joint'};
                              

rGoalMsg.Trajectory.Points = tjPointC;

%%%%%% Declaracion brazo izquierdo

[lArm, lGoalMsg] = rosactionclient('l_arm_controller/joint_trajectory_action');
waitForServer(lArm);

lGoalMsg.Trajectory.JointNames = {'l_shoulder_pan_joint', ...
                                   'l_shoulder_lift_joint', ...
                                   'l_upper_arm_roll_joint', ...
                                   'l_elbow_flex_joint',...
                                   'l_forearm_roll_joint',...
                                   'l_wrist_flex_joint',...
                                   'l_wrist_roll_joint'};


lGoalMsg.Trajectory.Points = tjPointC;

%%%%%% Movimiento Ambos brazos

% sendGoalAndWait(rArm,rGoalMsg);
% sendGoalAndWait(lArm,lGoalMsg);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% Obtencion de la ruta desde el .yaml

path = getWaypoints;

%%%%%% Declaración necesaria para la obtencion de la posicion y orientacion del robot.

orientacion_relativa = 90;

gazebo = ExampleHelperGazeboCommunicator();
kobuki = ExampleHelperGazeboSpawnedModel('pr2',gazebo);

%%%%%% Bucle que repite la trayectoria hasta el siguiente punto

for i = 6:12%size(path)
    
    %%%%%% Mira al proximo punto
    
    pr2_autoorientation_to_waypoint(path(i,:));
    
    %%%%%% Ve al proximo punto
    
    pr2_move_to_waypoint(path(i,:));
    
end


rosshutdown;