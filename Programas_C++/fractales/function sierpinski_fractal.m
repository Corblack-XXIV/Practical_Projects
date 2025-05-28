function sierpinski_fractal(iterations)
%SIERPINSKI_FRACTAL Genera el fractal de Sierpinski.
%   sierpinski_fractal(iterations) dibuja el fractal de Sierpinski
%   después de un número especificado de 'iterations'.
%
%   Ejemplo de uso:
%   sierpinski_fractal(5)

if nargin < 1
    iterations = 5; % Número de iteraciones por defecto
end

% Definir los vértices iniciales de un triángulo equilátero
% Puedes ajustar estas coordenadas para cambiar la posición y el tamaño.
p1 = [0, 0];
p2 = [1, 0];
p3 = [0.5, sqrt(3)/2]; % Para un triángulo equilátero

% Inicializar un punto arbitrario dentro del triángulo
% Se recomienda un punto aleatorio o el centroide del triángulo.
current_point = (p1 + p2 + p3) / 3;

% Crear una figura para el plot
figure;
hold on;
axis equal; % Asegura que los ejes tengan la misma escala
axis off;   % Oculta los ejes para una mejor visualización del fractal

% Trazar los vértices iniciales (opcional, para ver el triángulo inicial)
% plot([p1(1), p2(1), p3(1), p1(1)], [p1(2), p2(2), p3(2), p1(2)], 'k-');

% Generar el fractal
num_points = 3^iterations; % El número de puntos generados es 3^n
points_to_plot = zeros(num_points, 2); % Pre-asignar memoria para eficiencia

for i = 1:num_points
    % Elegir un vértice aleatoriamente (1, 2 o 3)
    random_vertex_idx = randi(3);

    % Mover el punto a la mitad de la distancia hacia el vértice elegido
    if random_vertex_idx == 1
        current_point = (current_point + p1) / 2;
    elseif random_vertex_idx == 2
        current_point = (current_point + p2) / 2;
    else % random_vertex_idx == 3
        current_point = (current_point + p3) / 2;
    end
    
    % Almacenar el punto para graficar
    points_to_plot(i, :) = current_point;
end

% Graficar todos los puntos generados
plot(points_to_plot(:,1), points_to_plot(:,2), 'k.', 'MarkerSize', 1); % Puntos negros pequeños

title(sprintf('Fractal de Sierpinski (%d iteraciones)', iterations));
hold off;

end

%PARA HACERLO FUNCIONAR DEBE ESCRIBIR (sierpinski_fractal(12)%