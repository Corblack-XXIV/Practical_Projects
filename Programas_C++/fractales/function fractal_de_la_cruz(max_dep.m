function fractal_de_la_cruz(max_depth)
%FRACTAL_DE_LA_CRUZ Genera el fractal de la cruz (tipo Vicsek o Box Fractal).
%   fractal_de_la_cruz(max_depth) dibuja el fractal de la cruz
%   hasta un número especificado de niveles de recursión (max_depth).
%
%   Este fractal se construye recursivamente dividiendo un cuadrado
%   en 9 sub-cuadrados (una cuadrícula de 3x3) y manteniendo solo
%   el cuadrado central y los cuatro cuadrados en las direcciones
%   cardinales (arriba, abajo, izquierda, derecha).
%
%   Ejemplo de uso:
%   fractal_de_la_cruz(4)  % Genera el fractal con 4 niveles de detalle

if nargin < 1
    max_depth = 4; % Nivel de recursión por defecto si no se especifica
end

% Configuración inicial de la figura
figure;
hold on;          % Permite dibujar múltiples objetos en los mismos ejes
axis equal;       % Asegura que las proporciones de los ejes sean iguales (cuadrados perfectos)
axis off;         % Oculta los ejes para una vista más limpia del fractal
set(gca, 'Color', [1 1 1]); % Establece el fondo blanco (opcional, suele ser por defecto)
colormap([0 0 0]); % Asegura que 'fill' use el color negro

% Definir el cuadrado inicial
% (x, y, lado_del_cuadrado_inicial)
initial_x = 0;
initial_y = 0;
initial_side = 1; % Un cuadrado unitario para empezar

% Llamar a la función recursiva para dibujar el fractal
% Esta función se encarga de dibujar los cuadrados en cada nivel.
dibujar_cuadrado_recursivamente(initial_x, initial_y, initial_side, max_depth);

% Ajustar los límites de los ejes para que el fractal se vea centrado y sin bordes
xlim([-0.05, 1.05]); % Un poco de margen alrededor del cuadrado unitario
ylim([-0.05, 1.05]);

title(sprintf('Fractal de la Cruz (Profundidad %d)', max_depth), 'FontSize', 14, 'FontWeight', 'bold');
hold off;

end

% --- SUB-FUNCIÓN RECURSIVA PARA DIBUJAR LOS CUADRADOS ---
% Esta función no es accesible directamente desde la línea de comandos,
% solo es llamada por la función principal 'fractal_de_la_cruz'.
function dibujar_cuadrado_recursivamente(x, y, side_length, current_depth)
    % Condición base de la recursión:
    % Si la profundidad actual es 0, significa que hemos alcanzado el nivel
    % de detalle deseado y debemos dibujar el cuadrado actual.
    if current_depth == 0
        % Coordenadas de los vértices del cuadrado:
        % [x_esquina_inferior_izquierda, x_esquina_inferior_derecha, x_esquina_superior_derecha, x_esquina_superior_izquierda]
        xv = [x, x + side_length, x + side_length, x];
        % [y_esquina_inferior_izquierda, y_esquina_inferior_derecha, y_esquina_superior_derecha, y_esquina_superior_izquierda]
        yv = [y, y, y + side_length, y + side_length];

        % 'fill' dibuja un polígono relleno. 'k' indica color negro.
        fill(xv, yv, 'k');
        return; % Termina la llamada recursiva para este cuadrado
    end

    % Paso recursivo:
    % Si current_depth > 0, dividimos el cuadrado actual en 9 sub-cuadrados
    % y llamamos recursivamente a la función para los 5 sub-cuadrados que forman la cruz.
    new_side_length = side_length / 3;

    % Coordenadas de los 5 sub-cuadrados que se mantienen (formando la cruz)
    % El patrón es:
    % [ ] [A] [ ]
    % [D] [C] [E]
    % [ ] [B] [ ]
    % donde C = Central, A = Arriba, B = Abajo, D = Izquierda, E = Derecha

    % 1. Cuadrado Central
    dibujar_cuadrado_recursivamente(x + new_side_length, y + new_side_length, new_side_length, current_depth - 1);

    % 2. Cuadrado de Arriba
    dibujar_cuadrado_recursivamente(x + new_side_length, y + 2 * new_side_length, new_side_length, current_depth - 1);

    % 3. Cuadrado de Abajo
    dibujar_cuadrado_recursivamente(x + new_side_length, y, new_side_length, current_depth - 1);

    % 4. Cuadrado de la Izquierda
    dibujar_cuadrado_recursivamente(x, y + new_side_length, new_side_length, current_depth - 1);

    % 5. Cuadrado de la Derecha
    dibujar_cuadrado_recursivamente(x + 2 * new_side_length, y + new_side_length, new_side_length, current_depth - 1);

end

%PARA QUE CORRA SE DEBE ESCRIBIR   fractal_de_la_cruz%