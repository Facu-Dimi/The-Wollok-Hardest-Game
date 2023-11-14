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


	method choque(llaves){
		if (cuadrado.llaves().size() >= 1){
			llaves.forEach{llave => game.addVisual(llave)}
			}
			choque_bola.play()
			cuadrado.chocar_obstaculo()
			menu.sumar_muerte()
		}
		
	
	method volver(posicion, limite){
		if (posicion == limite){
			vuelta = false
			}
		if (posicion == limite_1){
			vuelta = true
			}
		}
}
	


class Obstaculo_vertical inherits Obstaculo{
	
	method mover_arriba(){
		self.volver(position.y(), posicion_y)
		if (not vuelta){
			position = position.up(1)
		}
		else{ position = position.down(1)}
	}
	
	method mover_abajo(){
		self.volver(position.y(), posicion_y)
		if (not vuelta){
			position = position.down(1)
		}
		else{position = position.up(1)}
	}
}	


class Obstaculo_horizontal inherits Obstaculo{
	
	method mover_derecha(){
		self.volver(position.x(), posicion_x)
		if (not vuelta){
			position = position.right(1)
		}
		else{ position = position.left(1)}
	}


	method mover_izquierda(){
		self.volver(position.x(), posicion_x)
		if (not vuelta){
			position = position.left(1)
		}
		else{position = position.right(1)}
	}
}	


class Obstaculo_diagonal inherits Obstaculo{
	method mover_derecha(movimiento){
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
	method mover_izquierda(movimiento){
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
	
	override method volver(posicion, limite){
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
	
	method mover_cubo(){
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
