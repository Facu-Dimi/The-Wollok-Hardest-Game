import wollok.game.*
import elementos.*
import obstaculos.*



// Parametros del Juego y Metodos Principales.//////////////////////////////////////////////////


object juego{
	
	var property indice_y = 24
	var property indice_x = 0
	
	method iniciar(){
		game.width(30)//75
		game.height(25)//60 
		game.cellSize(25)//15
		game.title("Wollok Hardest Game")	
	}
	
	method generar_visuales(lista){
		const pared_tipo = lista.get(0)
		lista.forEach{indice => 
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
				if (indice_x == 29){
					indice_y -= 1
					indice_x = 0
				}
				else{
					indice_x += 1
				}
		}
		
		indice_y = 24
		
	}

}