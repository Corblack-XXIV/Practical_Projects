// SCILAB SCRIPT PARA EL PROBLEMA DE CRECIMIENTO BACTERIANOCRECIMIENTO BACTERIANO

// LIMPIEZA DE CONSOLA Y VARIABLES
// clear: Elimina todas las variables del entorno de trabajo.
clear;
// clc: Limpia la ventana de la consola.
clc;

// --- PASO 1: CALCULAR LA CONSTANTE DE CRECIMIENTO (k) ---

// DESCRIPCIÓN:
// El problema establece que en t=1 hora, el número de bacterias es (5/3)P0.
// Usamos la ecuación de crecimiento P(t) = P0 * exp(k*t).
// Para t=1, tenemos (5/3)P0 = P0 * exp(k*1).
// Dividiendo por P0, obtenemos (5/3) = exp(k).
// Aplicando logaritmo natural (ln) a ambos lados, obtenemos k = ln(5/3).

// CÁLCULO DE k:
// log() en Scilab calcula el logaritmo natural por defecto.
k = log(5/3);

// MOSTRAR EL VALOR DE k (OPCIONAL)
// disp(): Muestra un mensaje o el valor de una variable.
// string(): Convierte un número a una cadena de texto para mostrarlo.
disp("--- Paso 1: Calcular la constante de crecimiento (k) ---");
disp("La ecuación es: (5/3)P0 = P0 * exp(k*1)");
disp("Despejando k, tenemos: k = ln(5/3)");
disp("El valor de la constante de crecimiento k es: " + string(k));
disp(" "); // Línea en blanco para mejor formato

// --- PASO 2: DETERMINAR EL TIEMPO PARA QUE SE QUINTUPLIQUE EL NÚMERO DE BACTERIAS ---

// DESCRIPCIÓN:
// Queremos encontrar el tiempo (t_quintuple) en el cual P(t_quintuple) = 5*P0.
// Usando la ecuación de crecimiento: 5*P0 = P0 * exp(k*t_quintuple).
// Dividiendo por P0: 5 = exp(k*t_quintuple).
// Aplicando logaritmo natural a ambos lados: ln(5) = k*t_quintuple.
// Despejando t_quintuple: t_quintuple = ln(5) / k.

// CÁLCULO DE t_quintuple:
t_quintuple = log(5) / k;

// MOSTRAR EL RESULTADO FINAL
disp("--- Paso 2: Determinar el tiempo para que se quintuplique el número de bacterias ---");
disp("La ecuación es: 5*P0 = P0 * exp(k*t)");
disp("Despejando t, tenemos: t = ln(5) / k");
disp("El tiempo necesario para que el número de bacterias se quintuplique es: " + string(t_quintuple) + " horas.");

// --- FIN DEL SCRIPT ---
