### Modulo suma ###

def Suma_binario(bin1, bin2):

    max_length = (max(len(bin1), len(bin2)))

    bin1 = bin1.zfill(max_length)
    bin2 = bin2.zfill(max_length)
    
    acarreo = 0
    result = []
    
    for i in range(max_length - 1, -1, -1):
        bit_sum = int(bin1[i]) + int(bin2[i]) + acarreo
        result.insert(0, str(bit_sum % 2))
        acarreo = bit_sum // 2
    
    if acarreo:
        result.insert(0, str(acarreo))
    
    resultado = ''.join(result)
    
    return resultado

