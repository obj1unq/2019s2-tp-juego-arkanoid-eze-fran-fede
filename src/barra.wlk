import wollok.game.*
import direcciones.*


class Barra{
	var property position //= new Position(x = 4, y = 0)
	
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
}
/*
class Normal inherits Barra {
	
	var property cosas = [ new Barra(position = new Position(x = position.x(), y = 0))]
	
	method dibujarBarras(){
		game.addVisual(cosas.first())
	}
	
}

*/
