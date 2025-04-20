### Modulo divi ###
import Modulo_resta as res
import Modulo_suma as suma

def Div_binario(num1, num2):
    result = ''
    temp = '0'
    r = 0

    if int(num1) < int(num2):
            result = '0'  
    else:    
        for i in range(len(num1)):  

            if int(num2) > int(temp):
                result += '0'
                temp += num1[i]
            else:
                r = res.Resta_binario(temp, num2)
                if r == 0:
                    temp = num1[i]
                    result += '1'
                else:
                    r = str(r).lstrip('0')
                    result += '1'
                    temp = r + num1[i]

        if temp !=int(0): 
            result = result + '0' 

        result=suma.Suma_binario(result,"1")
              
    return result
