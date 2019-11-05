import orientacion.*
import wollok.game.*

class Bloques{
	var property position 
	
	method rebotar(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	method efecto(){
		game.removeVisual(self)	
	}
	
	method cambiarPanorama(unaPelota) {
		 unaPelota.vaAlNorte(false)
		 }
	
}

class BloqueAmarillo inherits Bloques{
	
	method image() = "BloqueAmarillo0.png"
}

class BloqueAzul inherits Bloques{

	method image() = "BloqueAzul.png"
}

class BloqueFucsia inherits Bloques{
	
	method image() = "Bloquefucsia.png"
}