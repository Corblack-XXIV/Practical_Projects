// Ruta del archivo CSV
ruta = "/Users/nicolascortesparra/Desktop/proyectos/mafe/emociones/Emociondia.csv";

// Leer el archivo línea por línea
datos = mgetl(ruta);

// Separar los datos (saltando la cabecera)
datos = datos(2:length(datos), :); // Funciona con vectores columna // Ignora la cabecera // Ignora la primera línea con los encabezados

// Inicializar vectores
hora = [];
emocion = [];
valor = [];

for i = 1:length(datos)
    fila = strsplit(datos(i), ",");
    hora(i) = fila(5);
    emocion(i) = fila(6);
    valor(i) = fila(8);
end

// Convertir valores a número
valor_num = zeros(length(valor), 1);
for i = 1:length(valor)
    valor_num(i) = evstr(valor(i));
end

// Convertir horas a formato numérico
horas_num = zeros(length(hora), 1);
for i = 1:length(hora)
    t = stripblanks(hora(i));
    if strindex(t, "a.m.") > 0 then
        t = part(t, 1:strindex(t, "a.m.")-1);
        h = evstr(part(t, 1:strindex(t, ":")-1));
        m = evstr(part(t, strindex(t, ":")+1:$));
        horas_num(i) = h + m/60;
    else
        t = part(t, 1:strindex(t, "p.m.")-1);
        h = evstr(part(t, 1:strindex(t, ":")-1));
        m = evstr(part(t, strindex(t, ":")+1:$));
        if h <> 12 then
            h = h + 12;
        end
        horas_num(i) = h + m/60;
    end
end

// Asignar colores según emoción
colores = ["red", "blue", "green"];
emociones = ["FELICIDAD", "TRISTEZA", "ENOJO"];

scf(0); // Nueva figura
clf();

// Graficar cada emoción por separado
for j = 1:length(emociones)
    idx = find(emocion == emociones(j));
    if ~isempty(idx) then
        plot(horas_num(idx), valor_num(idx), 'o', 'markerfacecolor', colores(j));
        legends(emociones(j), j);
        hold on;
    end
end

xtitle("Valor de emociones a lo largo del día", "Hora", "Valor");
xticks(7:2:21); // De 7 a.m. a 9 p.m.
xgrid();
