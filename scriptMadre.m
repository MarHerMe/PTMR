%%
%%% Hola, soy un script de matlab y pretendo ser vuestro compañero y guía 
%%% durante el trabajo de PTMR :)

%%
%%% Primer paso: programación reactiva del robot para que navegue por el 
%%% mapa y poder así construirlo y almacenarlo. (Este subprograma es el
%%% necesario para Robots Móviles). 

%%% Utilizar una estrategia de navegación y comandos de ROS que muevan al 
%%% robot por la estancia, habrá que leer los sensores para evitar
%%% colisiones y utilizar la dilatación del robot.

%%% Almacenar (magic) el mapa para consultarlo en la parte de planificación. 

%%
%%% Segundo paso: implementación del algoritmo de descomposición en celdas.

%%% División secuencial en celdas del mapa guardado y etiquetado de las
%%% zonas (FULL, MIXTED, EMPTY).

%%% Almacenamiento del mapa 'EMPTY' para la planificación. 

%%
%%% Tercer paso: planificación del movimiento sobre el mapa 'EMPTY'.
%%% "Rectangulización" del espacio y movimiento por centros desde el incio
%%% hasta la meta.

%%% Utilización de matlab para calcular los puntos por los que nos movemos
%%% teniendo en cuenta la dilatación del robot.
%%% Comandos de ROS para llevar a cabo la navegación. 

%% 
%%% Cuarto paso: manipulación y grasping. Con el robot en la posición
%%% óptima coger la lata de la mesa. Utilizar comandos de ROS y buscarnos
%%% la vida para encontrar algoritmos de planificación de trayectorias. 
