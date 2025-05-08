// SCILAB SCRIPT PARA EL PROBLEMA DE MODELO SIMPLE DE POBLACIÓN

// LIMPIEZA DE CONSOLA Y VARIABLES
// clear: Elimina todas las variables del entorno de trabajo.
clear;
// clc: Limpia la ventana de la consola.MODELO SIMPLE DE POBLACIÓN

// --- DATOS INICIALES DEL PROBLEMA ---
// P0: Población inicial de bacterias.
P0 = 1786;
disp("--- Datos Iniciales ---");
disp("Población inicial (P0): " + string(P0) + " bacterias.");
disp("Condición: El número de bacterias se duplica después de 1 hora.");
disp(" ");

// --- PARTE 1: CALCULAR EL VALOR DE LA CONSTANTE k ---

// DESCRIPCIÓN:
// Se nos dice que P(1) = 2 * P0.
// Usamos la ecuación de crecimiento P(t) = P0 * exp(k*t).
// Para t=1, tenemos 2*P0 = P0 * exp(k*1).
// Dividiendo por P0, obtenemos 2 = exp(k).
// Aplicando logaritmo natural (ln) a ambos lados, obtenemos k = ln(2).

// CÁLCULO DE k:
// log() en Scilab calcula el logaritmo natural por defecto.
k = log(2);

// MOSTRAR EL VALOR DE k
disp("--- Parte 1: Calcular el valor de la constante k ---");
disp("La ecuación es: 2*P0 = P0 * exp(k*1)");
disp("Despejando k, tenemos: k = ln(2)");
disp("El valor de la constante de crecimiento k es: " + string(k));
disp(" "); // Línea en blanco para mejor formato

// --- PARTE 2: CALCULAR LA POBLACIÓN DESPUÉS DE HORA Y MEDIA (1.5 HORAS) ---

// DESCRIPCIÓN:
// Queremos encontrar la población P(t) cuando t = 1.5 horas.
// Usamos la ecuación: P(t) = P0 * exp(k*t).

// DEFINICIÓN DEL TIEMPO
t_media = 1.5; // horas

// CÁLCULO DE LA POBLACIÓN P(1.5)
// round() se usa para redondear al entero más cercano, ya que no podemos tener fracciones de bacterias.
P_t_media = round(P0 * exp(k * t_media));

// MOSTRAR EL RESULTADO
disp("--- Parte 2: Calcular la población después de hora y media (" + string(t_media) + " horas) ---");
disp("La ecuación es: P(t) = P0 * exp(k*t)");
disp("P(" + string(t_media) + ") = " + string(P0) + " * exp(" + string(k) + " * " + string(t_media) + ")");
disp("La población después de " + string(t_media) + " horas será aproximadamente: " + string(P_t_media) + " bacterias.");
disp(" ");

// --- PARTE 3: CALCULAR EN QUÉ MOMENTO LA POBLACIÓN ES DE 5000 BACTERIAS ---

// DESCRIPCIÓN:
// Queremos encontrar el tiempo (t_5000) en el cual P(t_5000) = 5000.
// Usando la ecuación de crecimiento: 5000 = P0 * exp(k*t_5000).
// Dividiendo por P0: 5000/P0 = exp(k*t_5000).
// Aplicando logaritmo natural a ambos lados: ln(5000/P0) = k*t_5000.
// Despejando t_5000: t_5000 = ln(5000/P0) / k.

// DEFINICIÓN DE LA POBLACIÓN OBJETIVO
P_objetivo = 5000;

// CÁLCULO DE t_5000
t_5000 = log(P_objetivo / P0) / k;

// MOSTRAR EL RESULTADO
disp("--- Parte 3: Calcular en qué momento la población es de " + string(P_objetivo) + " bacterias ---");
disp("La ecuación es: " + string(P_objetivo) + " = P0 * exp(k*t)");
disp("Despejando t, tenemos: t = ln(" + string(P_objetivo) + "/P0) / k");
disp("El tiempo necesario para que la población alcance " + string(P_objetivo) + " bacterias es: " + string(t_5000) + " horas.");

// --- FIN DEL SCRIPT ---
