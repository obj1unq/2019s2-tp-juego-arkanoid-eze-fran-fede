import direcciones.*
import wollok.game.*

class Bloques{
	var property position 
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	method efecto(){
		game.removeVisual(self)	
		game.sound("Golpe_03.wav")
	}
	
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(false)
		 }
	
}

class BloqueAmarillo inherits Bloques{
	
	method image() = "BloqueAmarillo.png"
}

class BloqueAzul inherits Bloques{

	method image() = "BloqueAzul.png"
}

class BloqueFucsia inherits Bloques{
	
	method image() = "Bloquefucsia.png"
	
	override method efecto(){
		super()
		game.addVisual(new BloqueAzul( position = self.position()))	
	}
}