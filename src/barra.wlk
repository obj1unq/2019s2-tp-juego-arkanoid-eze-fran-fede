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
	
	method nuevaPosision(unaPosicion){		
		position = unaPosicion		
		
	}
	
	method efectoPowerUp() {}
}