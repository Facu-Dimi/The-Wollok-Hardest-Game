import wollok.game.*
import cuadrado.*
import elementos.*
import sonidos.*

// Clase Obstaculo y sus Subclases.

class Obstaculo{
	var property posicion_x = 0
	var property posicion_y = 0
	var property limite_1 = 0
	var property vuelta = false
	var property position = game.at(posicion_x, posicion_y)
	var property identificador = "Obstaculo"
	var property tipo = 1
	
	
	method image() = "bola" + tipo + ".png"


	method choque(llaves){// Recibe la lista de llaves del obejto cuadrado y las añade devuelta al juego, reproduce un sonido,
	                      // llama al metodo chocar_obstaculo de cuadrado y llama sumar_muerte del menu
		if (llaves.size() >= 1){
			llaves.forEach{llave => game.addVisual(llave)}
			}
			choque_bola.play()
			cuadrado.chocar_obstaculo()
			menu.sumar_muerte()
		}
		
	
	method volver(posicion, limite){// Recibe una posicion y un limite, si la posicion es igual al limite vuelta es false,
	                                // si la posicion es igual al limite_1 vuelta es igual a true.
		if (posicion == limite){
			vuelta = false
			}
		if (posicion == limite_1){
			vuelta = true
			}
		}
}
	


class Obstaculo_vertical inherits Obstaculo{
	
	method mover_arriba(){// Le pasa a volver su posicion en y, como limite le pasa la posicion en y incial
	                      // si las dos posiciones son iguales el obstaculo se movera para arriba.
	                      // si la posicion es igual al limite_1 el obstaculo se movera para abajo.
		self.volver(position.y(), posicion_y)
		if (not vuelta){
			position = position.up(1)
		}
		else{ position = position.down(1)}
	}
	
	method mover_abajo(){// Le pasa a volver su posicion en y, como limite le pasa la posicion en y incial
	                      // si las dos posiciones son iguales el obstaculo se movera para abajo.
	                      // si la posicion es igual al limite_1 el obstaculo se movera para arriba.
		self.volver(position.y(), posicion_y)
		if (not vuelta){
			position = position.down(1)
		}
		else{position = position.up(1)}
	}
}	


class Obstaculo_horizontal inherits Obstaculo{
	
	method mover_derecha(){// Le pasa a volver su posicion en x, como limite le pasa la posicion en x incial
	                       // si las dos posiciones son iguales el obstaculo se movera para la derecha.
	                       // si la posicion es igual al limite_1 el obstaculo se movera para la izquierda.
		self.volver(position.x(), posicion_x)
		if (not vuelta){
			position = position.right(1)
		}
		else{ position = position.left(1)}
	}


	method mover_izquierda(){// Le pasa a volver su posicion en x, como limite le pasa la posicion en x incial
	                         // si las dos posiciones son iguales el obstaculo se movera para la izquierda.
	                         // si la posicion es igual al limite_1 el obstaculo se movera para la dercha.
		self.volver(position.x(), posicion_x)
		if (not vuelta){
			position = position.left(1)
		}
		else{position = position.right(1)}
	}
}	


class Obstaculo_diagonal inherits Obstaculo{
	
	method mover_derecha(movimiento){// Le pasa a volver su posicion, como limite le pasa la posicion incial
	                                  // si las posiciones son iguales y el tipo de movimiento es 1 el obstaculo se movera para arriba a la derecha.
	                                  // si las posiciones son iguales a la posicion del limite_1 el obstaculo se movera para abajo a la izquierda.
	                                  // si el tipo de movimiento no es 1, se movera para abajo a la derecha y luego para arriba a la izquierda.
		self.volver(position, game.at(posicion_x, posicion_y))
		if (movimiento == 1){
		if (not vuelta){
			position = position.up(1).right(1)
		}
		else{ position = position.down(1).left(1)}
		}
		else{
			if (not vuelta){
			position = position.down(1).right(1)
		}
		else{ position = position.up(1).left(1)}
		}

	}
	method mover_izquierda(movimiento){// Le pasa a volver su posicion, como limite le pasa la posicion incial
	                                  // si las posiciones son iguales y el tipo de movimiento es 1 el obstaculo se movera para arriba a la izquierda.
	                                  // si las posiciones son iguales a la posicion del limite_1 el obstaculo se movera para abajo a la derecha.
	                                  // si el tipo de movimiento no es 1, se movera para abajo a la izquierda y luego para arriba a la derecha.
		self.volver(position, game.at(posicion_x, posicion_y))
		if (movimiento == 1){
		if (not vuelta){
			position = position.up(1).left(1)
		}
		else{position = position.down(1).right(1)}
		}
		else{
			if (not vuelta){
			position = position.down(1).left(1)
		}
		else{ position = position.up(1).right(1)}
			
		}
		
	}
}




class Obstaculo_cuadrado inherits Obstaculo{
	

	var property limite_2 = 2
	var property vuelta2 = false
	
	//limite_1 = x 
	//limite_2 = y
	
	override method volver(posicion, limite){// Recibe una posicion y como limite la posicion inicial, si la posicion en x es igual al limite_1 o
	                                         // si la posicion en y es igual al limite_2 vuelta o vuelta2 es true, si la posicion es igual al 
	                                         // limite en x y al limite_2 vuelta es false. Si la posicion es igual al limite vuelta2 es false.
		if (posicion.x() == limite_1){
			vuelta = true
		}
		if (posicion.y() == limite_2){
			vuelta2 = true
		}
		
		if (posicion == game.at(limite.x(), limite_2)){
			vuelta = false
		}
		if (posicion == game.at(limite.x(), limite.y())){
			vuelta2 = false
		}
		
	}
	
	method mover_cubo(){// Verifica el estado de las variables vuelta y vuelta2 y se mueve hacia una direccion
	                    // dependiendo de si son true o false.
		self.volver(position, game.at(posicion_x, posicion_y))
		if (not vuelta and not vuelta2){
			position  = position.right(1)
		}
		if (vuelta and not vuelta2){
			position = position.down(1)
		}
		if (vuelta and vuelta2){
			position = position.left(1)
		}
		if (not vuelta and vuelta2){
			position = position.up(1)
		}
	}
	
}


/* 
class Obstaculo_rombal inherits Obstaculo{
	var property limite_2 = 2
	var property vuelta2 = false
	
	
	override method volver(posicion, limite){
		if (posicion.x() == limite_1){
			vuelta = true
		}
		if (posicion.y() == limite_2){
			vuelta2 = true
		}

		if (posicion == game.at(limite_2, limite.x())){
			vuelta = false
		}
		
		if (posicion == game.at(limite.x(), limite.y())){
			vuelta2 = false
		}
	}

	method mover_rombal(){
		self.volver(position, game.at(posicion_x, posicion_y))
		if (not vuelta and not vuelta2){
			position  = position.right(1).down(1)
		}
		if (vuelta and not vuelta2){
			position = position.left(1).down(1)
		}
		if (vuelta and vuelta2){
			position = position.left(1).up(1)
		}
		if (not vuelta and vuelta2){
			position = position.right(1).up(1)
		}		
	}
	
}
*/


////////////////////////////////////////////////////////////////////////////////
