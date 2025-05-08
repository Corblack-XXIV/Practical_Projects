//Grafica de funciones parte 1 funcion constante
function y=funcionConstanteluz(x)// declara la funcion constante
    y=299.8;// salida de la funcion es la velocidad de la luz m/s
endfunction
x = linspace (-10,10,200); //este es el dominio, se define el espacio de la grafica en 200 puntos
subplot(4,3,1);//matriz 4 filas por 3 columnas, el uno es la posicion de la grafica para 12 graficas
plot(x,funcionConstanteluz(x), "v");// "v" forma que tendran los puntos en la grafica
xgrid  (2,1,4); //color 2 es azul, grueso de la linea 1 es el mas delgado, forma punteada 4
ylabel("Rapidez de la luz m/s","fontsize", 3, "color", "#ac29a7");//tamaño y color
xlabel("tiempo seg","fontsize", 3, "color", "#ac29a7");//tamaño y color

//grgfsorgod parte 2

//Grafica de funciones parte 1 funcion constante
function y=funcionConstantegravedad(x)// declara la funcion constante
    y=6.674*10^-11;// salida de la funcion es constante gravitacional N*m^2/Kg^2
endfunction
x = linspace (-10,10,200); //este es el dominio, se define el espacio de la grafica en 200 puntos
subplot(4,3,2);//matriz 4 filas por 3 columnas, el uno es la posicion de la grafica para 12 graficas
plot(x,funcionConstantegravedad(x), "v");// "v" forma que tendran los puntos en la grafica
xgrid  (2,1,4); //color 2 es azul, grueso de la linea 1 es el mas delgado, forma punteada 4
ylabel("fuerza y area N*m^2","fontsize", 3, "color", "blue");//tamaño y color
xlabel("masa kg^2","fontsize", 3, "color", "blue");//tamaño y color

//grgfsorgod parte 3

//Grafica de funciones parte 1 funcion constante
function y=funcionConstante(x)// declara la funcion constante // cambiar el nombre a un nombre espesifico para cada constante
    y=8.9875*10^9;// salida de la funcion es constante de coulomb N*m^2/c^2
endfunction
x = linspace (-10,10,200); //este es el dominio, se define el espacio de la grafica en 200 puntos
subplot(4,3,3);//matriz 4 filas por 3 columnas, el uno es la posicion de la grafica para 12 graficas
plot(x,funcionConstante(x), "v");// "v" forma que tendran los puntos en la grafica
xgrid  (2,1,4); //color 2 es azul, grueso de la linea 1 es el mas delgado, forma punteada 4
ylabel("fuerza y area N*m^2","fontsize", 3, "color", "#35236f");//tamaño y color
xlabel("carga electrica c^2","fontsize", 3, "color", "#35236f");//tamaño y color

//grgfsorgod parte 4

//Grafica de funciones parte 1 funcion constante
function y=funcionConstante(x)// declara la funcion constante // cambiar el nombre a un nombre espesifico para cada constante
    y=8.314472;// salida de la funcion es constante de los gases j/mol*k
endfunction
x = linspace (-10,10.200); //este es el dominio, se define el espacio de la grafica en 200 puntos
subplot(4,3,4);//matriz 4 filas por 3 columnas, el uno es la posicion de la grafica para 12 graficas
plot(x,funcionConstante(x), "v");// "v" forma que tendran los puntos en la grafica
xgrid  (2,1,4); //color 2 es azul, grueso de la linea 1 es el mas delgado, forma punteada 4
ylabel("energia j","fotsize", 3, "color", "blue");//tamaño y color // fotsize cambiar a fontsize
xlabel("cantidad de una sustancia en el sistema y temperatura mol*k","fotsize", 3, "color", "blue");//tamaño y color // fotsize cambiar a fontsize

