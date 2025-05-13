# Primero instalar la libreria fpdf

# ! pip install fpdf

from fpdf import FPDF

## Recibir datos del usuario
nombre_proyecto = input("Digitar la descripcion del proyecto: ")
horas_estimadas = input("Digita la cantidads de horas estimadas: ")
valor_hora = input("Digita el valor de la hora trabajada: ")
tiempo_estimado = input("Digita el plazo estimado: ")
valor_total = int(horas_estimadas) * int(valor_hora)

# Revisar que los datos esten correctos
print(f"Datos presentados: \n {nombre_proyecto} \n {horas_estimadas} \n {valor_hora} \n {tiempo_estimado} \n {valor_total}")


# Creacion del pdf
pdf = FPDF()

pdf.add_page()
pdf.set_font("Arial", size=12) # se configura el tipo de estilo y tamaño de la letra

pdf.image("Template.png", 0,0) # se importa imagenes o plantillas para formar el pdf

pdf.text(115, 145, nombre_proyecto) # se llaman las variables 
pdf.text(115, 160, horas_estimadas)
pdf.text(115, 175, valor_hora)
pdf.text(115, 190, tiempo_estimado)
pdf.text(115, 205, str(valor_total))

pdf.output("presupuesto.pdf") # se crea el pdf
print("El archivo se ha creado exitosamente")