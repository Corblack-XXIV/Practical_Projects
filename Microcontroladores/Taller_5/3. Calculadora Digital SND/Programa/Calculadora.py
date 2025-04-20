
"""" 
                CALCULADORA DE SUMA, RESTA, MULTIPLICACIÓN, DIVISIÓN Y POTENCIA ENTRE DIFERENTES SND
                                                TALLER V
                                              AGOSTO 2023
"""

#=================================================================IMPORTE DE LIBRERIAS=======================================================================
#Empezamos importando la libreria de la interfaz
import tkinter as tk
from tkinter import messagebox
#Estos son archivos aparte que contienen cada una de las operaciones
import Modulo_suma as suma
import Modulo_resta as resta
import Modulo_multiplicacion as mult
import Modulo_potencia as pot
import Modulo_division as div

#================================================================== FUNCIÓN 'CALCULAR'=========================================================================

#Creamos la funcion 'calcular'. Aquí vamos a leer las entradas de la interfaz, hacer conversiones entre los SND y las operaciones: s,r,m,d,p
def calcular():
    

#================================================================================================================================
#=========================================================ENTRADA 1=======================================================================
   
    n_bin1=nbin1_entry.get()                #Lee el número A ingresado por el usuario
    sist_origen1=sist_origen1_var.get()     #Pregunta el SN del número A
    
    if n_bin1=="":
        messagebox.showerror(message="Debe ingresar el número A ",title="Casilla Vacía")  
        nbin1_entry.delete(0,"end")
        
    if sist_origen1 == 'Binario':            #Pregunta si el sistema del número A es binario    
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            else:
                cont+=1
            
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    
        numero1 = str(n_bin1)           #Si el número es binario, lo muestra en binario tipo string
    
    elif sist_origen1 == 'Decimal':                 #Si el sistema del número A es decimal
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            elif n_bin1[i]=="8":
                cont+=0 
            elif n_bin1[i]=="9":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    
        numero1 = str(bin(int(n_bin1)))[2:] #Convierte el número A de decimal a binario
    
    elif sist_origen1 == 'Octal':                       #Pregunta si el número A es octal
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                
        numero1 = str(bin(int(n_bin1,8))[2:])       #Convierte el número A de octal a binario
    
    elif sist_origen1 == 'Hexadecimal':                         #Pregunta si el número A es hexadecimal
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            elif n_bin1[i]=="8":
                cont+=0 
            elif n_bin1[i]=="9":
                cont+=0 
            elif n_bin1[i]=="A":
                cont+=0 
            elif n_bin1[i]=="B":
                cont+=0     
            elif n_bin1[i]=="C":
                cont+=0 
            elif n_bin1[i]=="D":
                cont+=0 
            elif n_bin1[i]=="E":
                cont+=0 
            elif n_bin1[i]=="F":
                cont+=0 
            elif n_bin1[i]=="a":
                cont+=0 
            elif n_bin1[i]=="b":
                cont+=0     
            elif n_bin1[i]=="c":
                cont+=0 
            elif n_bin1[i]=="d":
                cont+=0 
            elif n_bin1[i]=="e":
                cont+=0 
            elif n_bin1[i]=="f":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado no es correcta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                
        numero1 = str(bin(int(n_bin1,16))[2:])      #Convierte el número A de hex a bin
    
#==================================================================================================================================
#==============================================================ENTRADA 2====================================================================    
   
    n_bin2=nbin2_entry.get()                        #Lee el número B ingresado por el usuario
    sist_origen2=sist_origen2_var.get()             #Pregunta el SN del número B
    
    if n_bin2=="":
        messagebox.showerror(message="Debe ingresar el número B ",title="Casilla Vacía")  
        nbin1_entry.delete(0,"end")
    
    if sist_origen2 == 'Binario':                   #Hace lo mismo que en la parte del número A para el número B:
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            else:
                cont+=1
            
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                
        numero2 = str(n_bin2)            
    
    elif sist_origen2 == 'Decimal':                 
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            elif n_bin2[i]=="8":
                cont+=0 
            elif n_bin2[i]=="9":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                
        numero2 = str(bin(int(n_bin2)))[2:]
    
    elif sist_origen2 == 'Octal':  
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                
        numero2 = str(bin(int(n_bin2,8))[2:])
    
    elif sist_origen2 == 'Hexadecimal':
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            elif n_bin2[i]=="8":
                cont+=0 
            elif n_bin2[i]=="9":
                cont+=0 
            elif n_bin2[i]=="A":
                cont+=0 
            elif n_bin2[i]=="B":
                cont+=0     
            elif n_bin2[i]=="C":
                cont+=0 
            elif n_bin2[i]=="D":
                cont+=0 
            elif n_bin2[i]=="E":
                cont+=0 
            elif n_bin2[i]=="F":
                cont+=0 
            elif n_bin2[i]=="a":
                cont+=0 
            elif n_bin2[i]=="b":
                cont+=0     
            elif n_bin2[i]=="c":
                cont+=0 
            elif n_bin2[i]=="d":
                cont+=0 
            elif n_bin2[i]=="e":
                cont+=0 
            elif n_bin2[i]=="f":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado no es correcta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                
        numero2 = str(bin(int(n_bin2,16))[2:])
    
#================================================================================================================================    
#==========================================================OPERACIONES========================================================================    
    
    operacion = operacion_var.get()                              #Lee la operación a realizar 
    
    if operacion=="+":
        result = (suma.Suma_binario(numero1,numero2))            #Importa el módulo suma: suma los binarios numero1 y numero2
    elif operacion=="-":                                                
        result = (resta.Resta_binario(numero1,numero2))          #Importa el módulo resta: resta los binarios numero1 y numero2    
    elif operacion=="*":
        result = (mult.Multi_binario(numero1,numero2))           #Importa el módulo multiplicación: multiplica los binarios numero1 y numero2
    elif operacion=="/":
        result = (div.Div_binario(numero1,numero2))          #Importa el módulo división: divide los binarios numero1 y numero2
    elif operacion=="^":
        result = (pot.Pot_binario(numero1,numero2))             #Importa el módulo potencia: eleva el número1 al exponente numero2
    
    sistema_resultado = sistema_resultado_var.get()              #Lee el sistema en el que el usuario quiere ver el resultado final
    
    if result:
        if sistema_resultado == 'Binario':                       #Este ciclo if convierte el resultado de la operación de binario al SN --> 
            resultado_final_snd = str(result)                    #--> :'sistema resultado' que haya seleccionado el usuario en la interfaz
        elif sistema_resultado == 'Decimal':
           resultado_final_snd = str(int(result,2))
        elif sistema_resultado == 'Octal':  
            resultado_final_snd = oct(int(result,2))[2:]        #Los '[2:]' sirven para eliminar los prefijos 0b, 0o, 0x de las conversiones
        elif sistema_resultado == 'Hexadecimal':
            resultado_final_snd = hex(int(result,2))[2:]
        else:
           print('Sistema numérico no válido.')
    
    cont_result=len(result)                                     # Cuenta la extencion del numero 
    cont_resultado=len(resultado_final_snd)  
           
    return resultado_final_var.set(resultado_final_snd.upper()),result_bin_var.set(result.upper()),cont_result_var.set(cont_result), cont_resultado_var.set(cont_resultado)        #El retorno de la función calcular es el valor operado y convertido a SN de selección


#================================================================== FUNCIÓN 'MOSTRAR_BIN1'===============================================================================

#Ahora vamos a crear la función 'mostrar_bin1' que va a convertir el numero A de cualquiera de los SN a binario. Luego se muestra en la interfaz
def mostrar_bin1():                                             
    n_bin1=nbin1_entry.get()                         #Se leen los valores ingresados por el usuario
    sist_origen1=sist_origen1_var.get()
    
    if sist_origen1 == 'Binario':                    #Se pregunta el SN del número A y se convierte a binario como se hizo en lineas anteriores 
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    mostrarb1.delete("start","end")
                    
        numero1 = str(n_bin1)
    
    elif sist_origen1 == 'Decimal':
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            elif n_bin1[i]=="8":
                cont+=0 
            elif n_bin1[i]=="9":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    mostrarb1.delete(0,"end")
        
        numero1 = str(bin(int(n_bin1)))[2:]
    
    elif sist_origen1 == 'Octal':  
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    mostrarb1.delete(0,"end")
                    
        numero1 = str(bin(int(n_bin1,8))[2:])
    
    elif sist_origen1 == 'Hexadecimal':
        cont=0
        for i in range(len(n_bin1)):
            if n_bin1[i]=="0":
                cont+=0
            elif n_bin1[i]=="1":
                cont+=0 
            elif n_bin1[i]=="2":
                cont+=0     
            elif n_bin1[i]=="3":
                cont+=0 
            elif n_bin1[i]=="4":
                cont+=0 
            elif n_bin1[i]=="5":
                cont+=0 
            elif n_bin1[i]=="6":
                cont+=0 
            elif n_bin1[i]=="7":
                cont+=0 
            elif n_bin1[i]=="8":
                cont+=0 
            elif n_bin1[i]=="9":
                cont+=0 
            elif n_bin1[i]=="A":
                cont+=0 
            elif n_bin1[i]=="B":
                cont+=0     
            elif n_bin1[i]=="C":
                cont+=0 
            elif n_bin1[i]=="D":
                cont+=0 
            elif n_bin1[i]=="E":
                cont+=0 
            elif n_bin1[i]=="F":
                cont+=0 
            elif n_bin1[i]=="a":
                cont+=0 
            elif n_bin1[i]=="b":
                cont+=0     
            elif n_bin1[i]=="c":
                cont+=0 
            elif n_bin1[i]=="d":
                cont+=0 
            elif n_bin1[i]=="e":
                cont+=0 
            elif n_bin1[i]=="f":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero A ingresado no es correcta ",title="Base Incorrecta")  
                    nbin1_entry.delete(0,"end")
                    mostrarb1.delete(0,"end")
        
        numero1 = str(bin(int(n_bin1,16))[2:])
    
    return bin1_var.set(numero1)                    #El retorno de la función 'mostrar_bin1' es el número A convertido a binario


#================================================================== FUNCIÓN 'MOSTRAR_BIN1'===============================================================================

#Ahora vamos a crear la función 'mostrar_bin2' que va a convertir el numero B de cualquiera de los SN a binario. Luego se muestra en la interfaz
def mostrar_bin2():                                 #Se leen los valores ingresados por el usuario en la interfaz  
    n_bin2=nbin2_entry.get()
    sist_origen2=sist_origen2_var.get()
    
    
    if sist_origen2 == 'Binario':                   #Se pregunta el SN del número B y se convierte a binario como se hizo en lineas anteriores
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                    mostrarb2.delete("start","end")
                    
        numero2 = str(n_bin2)
    
    elif sist_origen2 == 'Decimal':
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            elif n_bin2[i]=="8":
                cont+=0 
            elif n_bin2[i]=="9":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                    mostrarb2.delete(0,"end")
                    
        numero2 = str(bin(int(n_bin2)))[2:]
    
    elif sist_origen2 == 'Octal':  
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado es incorrecta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                    mostrarb2.delete(0,"end")
                    
        numero2 = str(bin(int(n_bin2,8))[2:])
   
    elif sist_origen2 == 'Hexadecimal':
        cont=0
        for i in range(len(n_bin2)):
            if n_bin2[i]=="0":
                cont+=0
            elif n_bin2[i]=="1":
                cont+=0 
            elif n_bin2[i]=="2":
                cont+=0     
            elif n_bin2[i]=="3":
                cont+=0 
            elif n_bin2[i]=="4":
                cont+=0 
            elif n_bin2[i]=="5":
                cont+=0 
            elif n_bin2[i]=="6":
                cont+=0 
            elif n_bin2[i]=="7":
                cont+=0 
            elif n_bin2[i]=="8":
                cont+=0 
            elif n_bin2[i]=="9":
                cont+=0 
            elif n_bin2[i]=="A":
                cont+=0 
            elif n_bin2[i]=="B":
                cont+=0     
            elif n_bin2[i]=="C":
                cont+=0 
            elif n_bin2[i]=="D":
                cont+=0 
            elif n_bin2[i]=="E":
                cont+=0 
            elif n_bin2[i]=="F":
                cont+=0 
            elif n_bin2[i]=="a":
                cont+=0 
            elif n_bin2[i]=="b":
                cont+=0     
            elif n_bin2[i]=="c":
                cont+=0 
            elif n_bin2[i]=="d":
                cont+=0 
            elif n_bin2[i]=="e":
                cont+=0 
            elif n_bin2[i]=="f":
                cont+=0 
            else:
                cont+=1
                if cont==1:
                    messagebox.showerror(message="La base del numero B ingresado no es correcta ",title="Base Incorrecta")  
                    nbin2_entry.delete(0,"end")
                    mostrarb2.delete(0,"end")
                    
        numero2 = str(bin(int(n_bin2,16))[2:])
    

    return bin2_var.set(numero2)                    #El retorno de la función 'mostrar_bin2' es el número B convertido a binario


#================================================================================ INTERFAZ ==========================================================================================

# A continuación creamos la interfaz:
interfaz = tk.Tk()
interfaz.title('Calculadora entre diferentes SND')                                          #Título de la ventana
interfaz.configure(bg="forestgreen")
interfaz.geometry("1325x800")

#Creamos los 'widgets'
numero_conv_snd=tk.StringVar()

bin1_label = tk.Label(interfaz, text='Número A: ',font=("Lucida Bright","12","bold"))       #Se pide el primer número
nbin1_entry= tk.Entry(interfaz,bd=5,width=25)                                               #Se recibe el primer número que viaja a la función 'calcular' para convertir a bin
bin2_label = tk.Label(interfaz, text='Número B: ',font=("Lucida Bright","12","bold"))       #Se pide el segundo número
nbin2_entry = tk.Entry(interfaz,bd=5,width=25)                                              #Se recibe el segundo número que viaja a la función 'calcular' para convertir a bin

sist_origen1_var = tk.StringVar(value='Decimal')                                            #Se define la opción por default que va a aparecer en el menú
sist_origen1_menu = tk.OptionMenu(interfaz, sist_origen1_var, 'Binario', 'Octal', 'Decimal', 'Hexadecimal') #Se crea el menú con los posibles SND del número A
sist_origen2_var = tk.StringVar(value='Decimal')                                                            #Se define la opción por default que va a aparecer en el menú
sist_origen2_menu = tk.OptionMenu(interfaz, sist_origen2_var, 'Binario', 'Octal', 'Decimal', 'Hexadecimal') #Se crea el menú con los posibles SND del número B

mostrar_bin1_button = tk.Button(interfaz, text='Convertir', command=mostrar_bin1)                 #Se crea el botón que convierte el número A a binario
nbin1_label = tk.Label(interfaz, text='A en Binario -> ',font=("Lucida Bright","10","bold"))      
nbin1_label.grid(row=1, column=0, padx=0, pady=5)                                                 #Localiza el resultado en la ventana a través de las coordenadas de fila y columna
bin1_var=tk.StringVar()                                                                           #Sirve como puente entre el codigo y la interfaz
mostrarb1=tk.Entry(interfaz,bd=5,textvariable=bin1_var,bg="palegoldenrod",fg="black",width=70,) #Muestra la conversión a binario

mostrar_bin2_button = tk.Button(interfaz, text='Convertir', command=mostrar_bin2)                 #Se crea el botón que convierte el número B a binario
nbin2_label = tk.Label(interfaz, text='B en Binario -> ',font=("Lucida Bright","10","bold"))      #Muestra la conversión a binario del número B ingresado
nbin2_label.grid(row=3, column=0, padx=0, pady=5)                                                 #Ubica el resultado de la conversión en la ventana a través de la fila y columna
bin2_var=tk.StringVar()                                                                           #Sirve como puente entre el codigo y la interfaz
mostrarb2=tk.Entry(interfaz,bd=5,textvariable=bin2_var,bg="palegoldenrod",fg="black",width=70)

operacion_label = tk.Label(interfaz, text='Operación:',font=("Lucida Bright","12","bold"))        #Pregunta por la operación a realizar
operacion_var = tk.StringVar(value='+')                                                           #Muestra la suma como la operación por default a realizar
operacion_menu = tk.OptionMenu(interfaz, operacion_var, '+', '-', '*', '/', '^')                  #Despliega el menú de operaciones posibles

sistema_resultado_label = tk.Label(interfaz, text='Sistema resultado:',font=("Lucida Bright","12","bold")) #Pregunta al usuario en qué sistema quiere ver reflejado el resultado
sistema_resultado_var = tk.StringVar(value='Decimal')                                             #Asigna el sistema decimal por default
sistema_resultado_menu = tk.OptionMenu(interfaz, sistema_resultado_var, 'Binario', 'Octal', 'Decimal', 'Hexadecimal') #Despliega el menu

calcular_button = tk.Button(interfaz, text='Calcular', command=calcular)                          #Se crea el botón que ejecuta el programa (conversión, operación)
resultado_label = tk.Label(interfaz, text='El resultado es:',font=("Lucida Bright","12","bold"))  
resultado_final_var=tk.StringVar()                                                                 #Sirve como puente entre el codigo y la interfaz
fin=tk.Entry(interfaz,bd=5,textvariable=resultado_final_var,bg="palegoldenrod",fg="black",width=170)   #Se crea una casilla scrollable que muestra el valor final (operado y convertido al SND final)

resultado_bin_label = tk.Label(interfaz, text='El resultado en binario es:',font=("Lucida Bright","12","bold"))
result_bin_var=tk.StringVar()
result_bin=tk.Entry(interfaz,bd=5,textvariable=result_bin_var,bg="palegoldenrod",fg="black",width=170)

cont_result_label = tk.Label(interfaz, text='Número caractéres:',font=("Lucida Bright","10","bold"))
cont_result_var=tk.StringVar()
cont_result_salida=tk.Entry(interfaz,bd=5,textvariable=cont_result_var,bg="palegoldenrod",fg="black",width=25)

cont_resultado_label = tk.Label(interfaz, text='Número carácteres:',font=("Lucida Bright","10","bold"))
cont_resultado_var= tk.StringVar()
cont_resultado_salida=tk.Entry(interfaz,bd=5,textvariable=cont_resultado_var,bg="palegoldenrod",fg="black",width=25)

#A continuación asignamos las coordenadas a cada parámetro en la ventana de la interfaz

bin1_label.grid(row=0, column=0, padx=5, pady=25)
nbin1_entry.grid(row=0, column=1, padx=5, pady=5)
sist_origen1_menu.grid(row=0, column=3, padx=0, pady=5)

bin2_label.grid(row=2, column=0, padx=5, pady=25)
nbin2_entry.grid(row=2, column=1, padx=5, pady=5)
sist_origen2_menu.grid(row=2, column=3, padx=0, pady=5)

mostrar_bin1_button.grid(row=1, column=3, padx=5, pady=5)
mostrar_bin2_button.grid(row=3, column=3, padx=5, pady=5)
mostrarb1.grid(row=1, column=1,padx=5, pady=5)
mostrarb2.grid(row=3, column=1,padx=5, pady=5)

operacion_label.grid(row=4, column=1, padx=0, pady=5)
operacion_menu.grid(row=4, column=3, padx=0, pady=5)

sistema_resultado_label.grid(row=5, column=1, padx=5, pady=0)
sistema_resultado_menu.grid(row=5, column=3, padx=5, pady=0)

calcular_button.grid(row=13, column=1, padx=0, pady=0)

resultado_label.grid(row=7, column=0, padx=5, pady=5)
fin.grid(row=7, column=1,padx=50, pady=25,columnspan=4)

resultado_bin_label.grid(row=9, column=0, padx=5, pady=5)
result_bin.grid(row=9, column=1,padx=50, pady=25,columnspan=4)


cont_result_label.grid(row=12, column=0, padx=5, pady=5)  #Resultado en binario
cont_result_salida.grid(row=12, column=1, padx=5, pady=5)

cont_resultado_label.grid(row=8, column=0, padx=2, pady=0) #Resultado convertido
cont_resultado_salida.grid(row=8, column=1, padx=2, pady=5)

interfaz.mainloop()