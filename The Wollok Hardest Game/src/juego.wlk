import wollok.game.*
import elementos.*
import obstaculos.*



// Parametros del Juego y Metodos Principales.//////////////////////////////////////////////////


object juego{
	
	// Variables indice_y e indice_x creadas segun el largo y el ancho del juego.
	
	var property indice_y = 24
	var property indice_x = 0
	
	method iniciar(){// Establece el alto y ancho del juego, el tamaño de las celdas y el titulo.
		game.width(30)//75
		game.height(25)//60 
		game.cellSize(25)//15
		game.title("Wollok Hardest Game")	
	}
	
	method generar_visuales(lista){
		
		// Crea la constante pared_tipo que vale el primer elemento de la lista.
		const pared_tipo = lista.get(0)
		
		// Recorre la lista recibida.
		lista.forEach{indice => 
			
			// Si el elemento es igual a P, O, L, o C se crea un objeto Pared, Obstaculo, Llave o Checkpoint
			// y se añade su visual al juego.
			// Se utiliza las variables indice_y e indice_x para crear los objetos en una posicion determinada dentro
			// del juego. Para pared se utiliza la variable pared_tipo para crear paredes con diferentes imagenes.
			
			
				if (indice == "P"){
					const pared = new Pared(posicion_x = indice_x, posicion_y = indice_y, tipo = pared_tipo)
					game.addVisual(pared)
					}
				if (indice == "O"){
					if (pared_tipo == "11"){
						const bola = new Obstaculo(posicion_x = indice_x, posicion_y = indice_y, tipo = 3)
					}
					else{
						const bola = new Obstaculo(posicion_x = indice_x, posicion_y = indice_y)
					}
					game.addVisual(bola)
					}
				if (indice == "L"){
					const llave = new Llave(position = game.at(indice_x, indice_y))
					game.addVisual(llave)
					}
				if (indice == "C"){
					const check = new Checkpoint(position = game.at(indice_x, indice_y))
					game.addVisual(check)
				}
				
				// Si indice_x llega a 29 (ancho del juego) al indice_y se le resta uno y el indice_x vuelve a valer 0.	
				if (indice_x == 29){
					indice_y -= 1
					indice_x = 0
				}
				else{// Sigue sumando uno hasta llegar a 29.
					indice_x += 1
				}
		}
		
		// Al terminar el for el inidice_y vuelve a valer 24 para poder recorrer la siguiente lista de la misma forma.
		indice_y = 24
		
	}

}