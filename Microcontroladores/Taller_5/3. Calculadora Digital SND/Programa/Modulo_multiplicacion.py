### Modulo_multiplicacion ###

import Modulo_suma

def Multi_binario(bin1, bin2):

    resultado = '0'
    x = 0 # Registro de cuántos desplazamientos se han realizado durante el proceso de multiplicación.
    for bit in reversed(bin1):
        if bit == '1':
            x_des = bin2 + '0' * x # Se crea un el binario desplazado hacia la izquierda.
            resultado = Modulo_suma.Suma_binario(resultado, x_des) # Suma del resultado mas el binario nuevo creado
        x += 1
    return resultado
