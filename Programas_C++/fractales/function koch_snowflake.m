function koch_snowflake
    n = 4;  % Nivel de recursión

    % Triángulo equilátero inicial
    p1 = [0, 0];
    p2 = [1, 0];
    angle = pi/3;
    p3 = [0.5, sin(angle)];

    % Generar los lados del copo de nieve
    side1 = koch_curve(p1, p2, n);
    side2 = koch_curve(p2, p3, n);
    side3 = koch_curve(p3, p1, n);

    % Unir los lados
    x = [side1(:,1); side2(2:end,1); side3(2:end,1)];
    y = [side1(:,2); side2(2:end,2); side3(2:end,2)];

    % Graficar
    figure
    plot(x, y, 'Color', [0, 0.6, 0], 'LineWidth', 1.5)
    axis equal off
    title('Copo de Nieve de Koch - Color Verde')
end

function points = koch_curve(p1, p2, n)
    if n == 0
        points = [p1; p2];
    else
        % Dividir el segmento en tres partes
        A = p1;
        B = p1 + (p2 - p1)/3;
        D = p1 + 2*(p2 - p1)/3;
        E = p2;

        % Calcular punto C, vértice del triángulo
        v = D - B;
        angle = pi/3;
        rot = [cos(angle), -sin(angle); sin(angle), cos(angle)];
        C = B + (rot * v')';

        % Recursión sobre los cuatro segmentos
        pA = koch_curve(A, B, n-1);
        pB = koch_curve(B, C, n-1);
        pC = koch_curve(C, D, n-1);
        pD = koch_curve(D, E, n-1);

        % Unir segmentos sin repetir nodos
        points = [pA(1:end-1,:); pB(1:end-1,:); pC(1:end-1,:); pD];
    end
end


%PARA QUE FUNCIONE SOLO SE DEBE ESCRIBIR (copo_de_nieve)%