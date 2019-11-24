import wollok.game.*
import direcciones.*


class Barra{
	var property position 
	
	method image() = "BarraNormal0.png"
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  norEste else norOeste 
	
	method efecto(){
		game.sound("Golpe_01.wav")
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(true)
	}
	
	method nuevaPosisionEste(unaPosicion){		
		position = game.at(13.min(unaPosicion.x()), unaPosicion.y())		
	}
	
	method nuevaPosisionOeste(unaPosicion){		
		position = game.at(1.max(unaPosicion.x()), unaPosicion.y())		
	}
	
	method efectoPowerUp() {}
	
	method sePuedeTranspasar() = false
}