function barnsley_fern(num_points)
%BARNSLEY_FERN Genera el fractal de la Hiedra de Barnsley.
%   barnsley_fern(num_points) dibuja el fractal de la Hiedra de Barnsley
%   generando un número especificado de 'num_points'.
%
%   Este fractal se construye usando un Sistema de Funciones Iteradas (IFS)
%   con cuatro transformaciones afines y sus probabilidades asociadas.
%
%   Ejemplo de uso:
%   barnsley_fern(500000) % Genera 500,000 puntos para un buen detalle
%   barnsley_fern(1000000) % Genera 1,000,000 puntos para mayor densidad y detalle

if nargin < 1
    num_points = 500000; % Número de puntos por defecto si no se especifica
end

% Definición de las 4 transformaciones afines del IFS
% Cada fila representa una transformación: [a b c d e f probabilidad]
% Las transformaciones son de la forma:
% x_new = a*x_old + b*y_old + e
% y_new = c*x_old + d*y_old + f
%
% Los valores son los estándar para la Hiedra de Barnsley.
transforms = [
    0.00, 0.00, 0.00, 0.16, 0.00, 0.00, 0.01;   % f1: Tallo (casi una línea vertical muy pequeña)
    0.85, 0.04, -0.04, 0.85, 0.00, 1.60, 0.85;  % f2: Partes grandes de la hoja (tallo principal y ramas)
    0.20, -0.26, 0.23, 0.22, 0.00, 1.60, 0.07;  % f3: Hojas de la izquierda (pequeñas)
    -0.15, 0.28, 0.26, 0.24, 0.00, 0.44, 0.07;  % f4: Hojas de la derecha (pequeñas)
];

% Extraer las probabilidades y normalizarlas (asegurarse de que sumen 1)
P = transforms(:, 7);
P = P / sum(P);

% Inicializar un punto (x, y) arbitrario. Se suele empezar en (0,0).
current_point = [0; 0]; % Usamos un vector columna [x; y]

% Pre-asignar memoria para almacenar todos los puntos generados (para eficiencia)
% 'points_to_plot' tendrá 'num_points' filas y 2 columnas (una para x, una para y).
points_to_plot = zeros(num_points, 2);

% Bucle principal para generar los puntos del fractal
for i = 1:num_points
    % Elegir una transformación basada en las probabilidades.
    % Se genera un número aleatorio entre 0 y 1 y se ve en qué rango de probabilidad cae.
    rand_val = rand();
    
    if rand_val < P(1)
        idx = 1; % Seleccionar la transformación f1
    elseif rand_val < P(1) + P(2)
        idx = 2; % Seleccionar la transformación f2
    elseif rand_val < P(1) + P(2) + P(3)
        idx = 3; % Seleccionar la transformación f3
    else
        idx = 4; % Seleccionar la transformación f4
    end
    
    % Obtener los coeficientes de la transformación elegida
    a_coeff = transforms(idx, 1);
    b_coeff = transforms(idx, 2);
    c_coeff = transforms(idx, 3);
    d_coeff = transforms(idx, 4);
    e_coeff = transforms(idx, 5); % Coeficiente de traslación en X
    f_coeff = transforms(idx, 6); % Coeficiente de traslación en Y

    % Obtener las coordenadas actuales del punto
    x_old = current_point(1);
    y_old = current_point(2);

    % Aplicar la transformación afín para obtener las nuevas coordenadas
    x_new = a_coeff * x_old + b_coeff * y_old + e_coeff;
    y_new = c_coeff * x_old + d_coeff * y_old + f_coeff;
    
    % Actualizar el punto actual
    current_point = [x_new; y_new];
    
    % Almacenar el punto generado en la matriz 'points_to_plot'
    points_to_plot(i, :) = current_point'; % Almacenar como una fila [x, y]
end

% Configuración de la figura para la visualización del fractal
figure;
% Graficar todos los puntos.
% 'g.' significa puntos de color verde. 'MarkerSize' 1 hace los puntos muy pequeños.
plot(points_to_plot(:, 1), points_to_plot(:, 2), 'g.', 'MarkerSize', 1);

set(gca, 'Color', 'k'); % Establecer el color de fondo del gráfico en negro (Axes background)
axis off; % Ocultar los ejes y etiquetas para una vista limpia del fractal
axis equal; % Asegura que la escala de los ejes X e Y sea la misma para evitar distorsiones

% Establecer los límites de los ejes X e Y para encuadrar correctamente el fractal
% Estos límites son conocidos para la Hiedra de Barnsley.
xlim([-3, 3]);  % Rango para el eje X
ylim([0, 10]);  % Rango para el eje Y (la hiedra crece hacia arriba)

title(sprintf('La Hiedra de Barnsley (%d puntos)', num_points), 'Color', 'w', 'FontSize', 14, 'FontWeight', 'bold'); % Título en blanco
% xlabel('X', 'Color', 'w'); % Estas etiquetas estarían ocultas por 'axis off'
% ylabel('Y', 'Color', 'w');

hold off; % Libera el gráfico
end