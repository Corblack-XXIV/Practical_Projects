### Modulo_resta ###

def Resta_binario(bin1, bin2):

    extension = max(len(bin1), len(bin2))
    bin1 = bin1.zfill(extension)
    bin2 = bin2.zfill(extension)
    
    resultado = []
    presta = 0
    condicion=0 #Para saber cuando se coloca el menos al principio
    
    if bin1 < bin2:  # cambio de ubicacion si el binario 1 es menor que el binario 2 para realizar la resta 
        condicion=1
        bin1, bin2 = bin2, bin1
        resultado = ["-",""]
    if condicion==0:
        resultado = [""]
    
    
    for i in range(extension - 1, -1, -1):
        bit1 = int(bin1[i])
        bit2 = int(bin2[i])
        
        bit1 -= presta
        
        if bit1 < bit2:
            bit1 += 2
            presta = 1
        else:
            presta = 0
        
        resultado.insert(1
                         , str(bit1 - bit2))
    
     
    
    return''.join(resultado)


