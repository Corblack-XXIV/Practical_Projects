// Función para calcular perímetro y área de un círculo
function [po, ao] = f(r)
    po = 2 * %pi * r; // Perímetro del círculo
    ao = %pi * r^2;   // Área del círculo
endfunction

// Definir radio del rinovirus en mm (d = 0.03 µm → r = 1.5 × 10⁻⁵ mm)
r = 0.000015; 

// Llamar a la función y obtener resultados
[perimetro, area] = f(r);

// Calcular número de individuos por mm²
num_individuos = 1 / area;

// Mostrar resultados en notación científica
printf("El perímetro del óvulo es: %e mm\n", perimetro);
printf("El área del óvulo es: %e mm^2\n", area);
printf("El número de individuos por mm² es aproximadamente: %e\n", num_individuos);


// Función para calcular perímetro y área de un círculo
function [po, ao] = f(r)
    po = 2 * %pi * r; // Perímetro del círculo
    ao = %pi * r^2;   // Área del círculo
endfunction

// Definir radio del rinovirus en mm (d = 0.03 µm → r = 1.5 × 10⁻⁵ mm)
r = 2.5e-5; 

// Llamar a la función y obtener resultados
[perimetro, area] = f(r);

// Calcular número de individuos por mm²
num_individuos = 1 / area;

// Mostrar resultados en notación científica
printf("El perímetro del óvulo es: %e mm\n", perimetro);
printf("El área del óvulo es: %e mm^2\n", area);
printf("El número de individuos por mm² es aproximadamente: %e\n", num_individuos);
