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

	method verificar_pared(posicion){
		const quizas_pared = game.getObjectsIn(posicion)
		return quizas_pared == [] or quizas_pared.get(0).identificador() != "Pared"
	}

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
		
	method agarrar(llave){
		agarrar_llave.play()
		llaves.add(llave)
	}
	
	method chocar_obstaculo(){
		position = spawn
		llaves.clear()
	}
	
	method cambiar_spawn(checkpoint){
		spawn = checkpoint
	}
}