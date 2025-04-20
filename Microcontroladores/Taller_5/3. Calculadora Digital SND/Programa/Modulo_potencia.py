### Modulo_potencia ###
import Modulo_multiplicacion as mult
def Pot_binario(base, exponente):
    result = '1'
    while exponente != '0':
        if int(exponente[-1]) % 2 == 1:
            result = mult.Multi_binario(result, base)
        base = mult.Multi_binario(base, base)
        exponente = Division_binaria_por_2(exponente)
    return result

def Division_binaria_por_2(bin_num):
    num_decimal = int(bin_num, 2)
    cociente = num_decimal // 2
    return bin(cociente)[2:]