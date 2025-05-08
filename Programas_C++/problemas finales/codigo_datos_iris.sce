//Cargar base de datos Iris
//DATOSIRIS=csvRead('recuerde que aquí se coloca la ubicación de su archivo)
//cargar base de datos iris xls
DATOSIRIS=csvRead('/Users/nicolascortesparra/Desktop/proyectos/mafe/problemas finales /base de datos iris.xlsx - Hoja1.csv')

/// s1 = DATOSIRIS(1); se elimina el comando por que arroja un error

// Asignaciones (usando directamente DATOSIRIS)
m1 = DATOSIRIS(2:20, 1:4); // extraer los datos de las filas 2-20 , de las columnas 1 a la 4
m2 = DATOSIRIS(1:151, 1); // extraer los datos de las filas 1-151 , de la columnas 1


lss = DATOSIRIS(2:51, 1); // extraemos los datos 50 de una de las especies datos de la columna 1 Largo sepalo 
lsve = DATOSIRIS(52:101, 1);
lsvi = DATOSIRIS(102:151, 1);

plot(lsvi);
xgrid(1, 1, 3); // Graficamos los datos extraídos

// Otros vectores
    // m3 = DATOSIRIS(1:151, 2);
    // Ass = DATOSIRIS(2:51, 2);
    // Asve = DATOSIRIS(52:101, 2);
    // Asvi = DATOSIRIS(102:151, 2);

// m4 = DATOSIRIS(1:151, 3);
// lps = DATOSIRIS(2:51, 3);
// lpve = DATOSIRIS(52:101, 3);
// lpvi = DATOSIRIS(102:151, 3);

// m5 = DATOSIRIS(1:151, 4);
// Aps = DATOSIRIS(2:51, 4);
// Apve = DATOSIRIS(52:101, 4);
// Apvi = DATOSIRIS(102:151, 4);
