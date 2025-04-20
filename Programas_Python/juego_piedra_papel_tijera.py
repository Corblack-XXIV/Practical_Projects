# juego pieddra papel o tijera 

import random as rd

print("Bienvenidoj a Piedra, Papel o Tijera: Duelo Rapido. Preparate para enfrentar a tu oponente en este clasico juego de decisiones rapidas. En este emocionante duelo, deberas elegir entre piedra, papel o tijera para derrotar a tu rival y convertirte en el campeon supremo.")
variable = ("piedra","papel","tijera")

rondas = 1
IA_win = 0
user_win = 0

while True:
    
    # tomamos opcion
    IA = rd.choice(variable)
    usuario = input("ingrese accion a jugar: piedra, papel, tijera => ")
    ##########
    
    print("---"*10)
    print ("ronda:", rondas, "\n", "marcador", user_win, "|", IA_win)
    print("---"*10)
    print ("la IA escogio =>", IA)
    print ("el usuario escogio =>", usuario)
    if not usuario in variable:
        print("opcion no valida")
        continue

    # condiciones de juego
    if usuario == IA:
        print("empate")

    elif usuario == "piedra":
        if IA == "tijera":
            print("ganaste esta ronda")
            user_win += 1
        else: # si ingresamos piedra, y la primera condicion no se cumple que es tijera, descartamos y la maquina tendra es papel
            print("perdiste esta ronda")
            IA_win += 1
    
    elif usuario == "tijera":
        if IA == "papel":
            print("ganaste esta ronda")
            user_win += 1
        else:
            print("perdiste esta ronda")
            IA_win += 1

    elif usuario == "papel":
        if IA == "piedra":
            print("ganaste esta ronda")
            user_win += 1
        else:
            print("perdiste esta ronda")
            IA_win += 1
    
    rondas += 1

    # Fin del juego 
    if user_win == 3:
        print("\n","\n","##"*7,"\n","# resultados #","\n","##"*7)
        print("---"*10)
        print("el marcador quedo =>", user_win, "|", IA_win)
        print("ganaste el juego")
        break
    if IA_win == 3:
        print("\n","\n","##"*7,"\n","# resultados #","\n","##"*7)
        print("---"*10)
        print("el marcador quedo =>", user_win, "|", IA_win)
        print("la computadora gano")
        break

