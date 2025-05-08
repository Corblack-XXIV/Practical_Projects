// PROBLEMA 3: MODELO SIMPLE POBLACIONAL EN SCILAB

// -----------------------------------------------------------------------------
// Definición de datos iniciales
// -----------------------------------------------------------------------------

// Población en enero de 2000 (P0)
P0 = 6.144e9; // 6.144 miles de millones = 6,144,000,000

// Tasa de crecimiento constante (R) en personas por día
R_crecimiento_diario = 250000; // 250,000 personas/día

// Población objetivo (Pf)
Pf = 11e9; // 11 mil millones = 11,000,000,000

// Fecha de inicio del cálculo
ano_inicio = 2000;
mes_inicio = 1; // Enero
dia_inicio = 1;

// -----------------------------------------------------------------------------
// Cálculos
// -----------------------------------------------------------------------------

// 1. Calcular el aumento de población necesario (deltaP)
deltaP = Pf - P0;

// 2. Calcular el número de días necesarios para este aumento (T_dias)
// Se redondea hacia arriba (ceil) por si hay una fracción de día,
// asegurando que se complete el crecimiento. En este caso, el resultado
// de la división es exacto, pero es una buena práctica considerarlo.
T_dias = ceil(deltaP / R_crecimiento_diario);

// -----------------------------------------------------------------------------
// Determinar la fecha futura
// -----------------------------------------------------------------------------

// Scilab utiliza números seriales para representar fechas.
// datenum(año, mes, día) convierte una fecha a un número serial.
// datevec(numero_serial) convierte un número serial de vuelta a [año, mes, día, hora, min, seg].

// Convertir la fecha de inicio a número serial
fecha_inicio_serial = datenum(ano_inicio, mes_inicio, dia_inicio);

// Sumar el número de días calculados al número serial de la fecha de inicio
fecha_fin_serial = fecha_inicio_serial + T_dias;

// Convertir el número serial resultante de nuevo a un vector de fecha [año, mes, día, ...]
vector_fecha_fin = datevec(fecha_fin_serial);

// Extraer año, mes y día del vector resultante
ano_fin = vector_fecha_fin(1);
mes_fin = vector_fecha_fin(2);
dia_fin = vector_fecha_fin(3);

// -----------------------------------------------------------------------------
// Mostrar los resultados
// -----------------------------------------------------------------------------
mprintf("PROBLEMA 3: MODELO SIMPLE POBLACIONAL\n");
mprintf("----------------------------------------\n");
mprintf("Población inicial (enero 2000): %.0f personas\n", P0);
mprintf("Población objetivo: %.0f personas\n", Pf);
mprintf("Tasa de crecimiento diario constante: %.0f personas/día\n", R_crecimiento_diario);
mprintf("\n");
mprintf("Aumento de población necesario: %.0f personas\n", deltaP);
mprintf("Número de días necesarios para alcanzar el objetivo: %.0f días\n", T_dias);
mprintf("\n");
mprintf("Fecha de inicio del cálculo: %02d/%02d/%d\n", dia_inicio, mes_inicio, ano_inicio);
mprintf("Se esperaría alcanzar la población de %.0f millones para el: %02d/%02d/%d\n", Pf/1e6, dia_fin, mes_fin, ano_fin);

// Comentario adicional sobre la exactitud del cálculo de días:
// El cálculo deltaP / R_crecimiento_diario dio 4856000000 / 250000 = 19424 días exactos.
// Por lo tanto, ceil(19424) sigue siendo 19424.
// Si la división hubiera resultado en, por ejemplo, 19424.1 días,
// significaría que el objetivo se alcanza DURANTE el día 19425.
// En nuestro caso, se alcanza al final del día 19424.
// datenum(2000,1,1) + 19424 da la fecha después de que hayan transcurrido 19424 días completos.
