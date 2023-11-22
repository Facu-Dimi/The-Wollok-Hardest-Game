import wollok.game.*
import cuadrado.*
import sonidos.*



// Elementos del juego. //////////////////////////////////////////////



object base{
	var property position = game.at(3, 4)
	var property identificador = "Base"
	method image(){
		return "base.png"
	}
}



object salida{
	var property position = game.at(25, 20)
	var property llaves_req = 1
	var property identificador = "Salida"
	method image(){
		return "salida.png"
	}
	

	method pasar_nivel(nivel){//genera los visuales y el movimiento de los obstaculos del nivel
	                          // establece como spawn la base y suma un nivel en el menu.
		    pasaste_nivel.play()
			nivel.empezar_nivel()
			nivel.nivel_obstaculos()
			cuadrado.spawn(base.position())
			game.say(self, "Has pasado el nivel")
			menu.sumar_nivel()
	}
}



class Pared{
	var property posicion_x = 0
	var property posicion_y = 0
	var property identificador = "Pared"
	var property tipo = "1"
	var property position = game.at(posicion_x, posicion_y)
	method image() = "pared" + tipo + ".jpg"
}



class Llave{
	var property position = game.at(3, 12)
	var property identificador = "Llave"
		method image(){
		return "llave.png"
	}
}


class Escenario{
	var property position = game.at(0, 0)
	var property identificador = "Escenario"
	var property numero_imagen = 1
	method image() = "escenario" + numero_imagen + ".jpg"
}


class Checkpoint{
	var property position = game.at(0, 0)
	var property identificador = "Checkpoint"
	method image(){
		return "checkpoint.png"
	}
	

}

object menu{
	
	var property position = game.at(4, 22)
	const property negro = "0000000"
	var property muertes = 0
	//var property segundos = 0
	var property nivel = 1
	var property identificador = "Menu"
	
	method sumar_muerte(){
		muertes += 1
		//game.say(self, "" + muertes)
	}
	method sumar_nivel(){
		nivel += 1
	}
	
	
	//method sumar_segundos(){segundos += 1}
	
	method image() = "muerte.png"

	 
	method text() = "muertes: " + muertes + "          " + "nivel: " + nivel + "/10" 
	//+ "          " + "tiempo: " + segundos
	
	method textColor() = self.negro()
}


object easter_egg{
	var property position = game.at(15, 21)
	var property identificador = "Easter_egg"
}




///////////////////////////////////////////////////////////////////////////////////////