// Definición de funciones constantes
function y=funcionConstanteLuz(x)
    y=299.8;
endfunction

function y=funcionConstanteGravedad(x)
    y=6.674*10^-11;
endfunction

function y=funcionConstanteCoulomb(x)
    y=8.9875*10^9;
endfunction

function y=funcionConstanteGases(x)
    y=8.314472;
endfunction

// Definición del dominio
x = linspace(-10, 10.2, 200);

// Subplot 1: Velocidad de la luz
subplot(4,3,1);
plot(x, funcionConstanteLuz(x), "r"); // Línea roja
xgrid(2,1);
ylabel("Rapidez de la luz (m/s)", "fontsize", 3, "color", "blue");
xlabel("Tiempo (s)", "fontsize", 3, "color", "blue");

// Subplot 2: Constante gravitacional
subplot(4,3,2);
plot(x, funcionConstanteGravedad(x), "g"); // Línea verde
xgrid(2,1);
ylabel("Fuerza y área (N·m²)", "fontsize", 3, "color", "blue");
xlabel("Masa (kg²)", "fontsize", 3, "color", "blue");

// Subplot 3: Constante de Coulomb
subplot(4,3,3);
plot(x, funcionConstanteCoulomb(x), "b"); // Línea azul
xgrid(2,1);
ylabel("Fuerza y área (N·m²)", "fontsize", 3, "color", "blue");
xlabel("Carga eléctrica (C²)", "fontsize", 3, "color", "blue");

// Subplot 4: Constante de los gases
subplot(4,3,4);
plot(x, funcionConstanteGases(x), "m"); // Línea magenta
xgrid(2,1);
ylabel("Energía (J)", "fontsize", 3, "color", "blue");
xlabel("Cantidad de sustancia (mol·K)", "fontsize", 3, "color", "blue");
