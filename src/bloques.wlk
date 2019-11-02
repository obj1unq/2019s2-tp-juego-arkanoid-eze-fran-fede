import orientacion.*
import wollok.game.*

class BloqueAmarillo{
	var property position 
	
	method image() = "BloqueAmarillo0.png"
	
	method rebotar() = surOeste
	
	method efecto(){
		game.removeVisual(self)	
	}
}