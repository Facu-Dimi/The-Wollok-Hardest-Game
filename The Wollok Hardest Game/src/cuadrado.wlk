import wollok.game.*
import elementos.*
import sonidos.*


// El Personaje. ///////////////////////////////////////////////////////////////////////


object cuadrado{
	var property spawn = base.position()
	var property position = spawn
	var property identificador = "Cuadrado"
	var property llaves_guardadas = []
	var property llaves = []
	method image(){
		return "cuadrado.jpg"
		}

	method verificar_pared(posicion){// Obtiene una posicion y verifica si el primer objeto que se encuentra en ella es una pared.
		const quizas_pared = game.getObjectsIn(posicion)
		return quizas_pared == [] or quizas_pared.get(0).identificador() != "Pared"
	}
	
	
	// Revisan si hay una pared en la posicion a la cual se quiere ir, si no la hay la posicion es igual a esta.

	method mover_arriba(){
		if (self.verificar_pared(position.up(1))){
		position = position.up(1)
		}
		}

	method mover_izquierda(){
		if (self.verificar_pared(position.left(1))){
		position = position.left(1)
		}
	}

	method mover_abajo(){
		if (self.verificar_pared(position.down(1))){
		position = position.down(1)
		}
	}

	method mover_derecha(){
		if (self.verificar_pared(position.right(1))){
		position = position.right(1)
		}
	}
	
	//
		
	method agarrar(llave){// Recibe un objeto de la clase Llave, reproduce un sonido y agrega la llave a la lista.
		agarrar_llave.play()
		llaves.add(llave)
	}
	
	method chocar_obstaculo(){// Regresa el cuadrado a el spawn cambiando su posicion y vacia la lista de llaves.
		position = spawn
		llaves.clear()
	}
	
	method cambiar_spawn(checkpoint){ // Cambia la posicion del spawn por la posicion de un objeto Checkpoint pasado por parametro.
		spawn = checkpoint
	}
}