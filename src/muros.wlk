import direcciones.*
import wollok.game.*

class ParedIzq {
	var property position 
	
	method image() = "ParedIzq.png"
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlNorte())  norEste else surEste
	
	method efecto(){
		
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlEste(true)
		 }

}
class ParedDer {
	var property position 
	
	method image() = "ParedDer.png"
	
	method redireccionarElemento(unaPelota) =   if(unaPelota.vaAlNorte())  norOeste else surOeste
	
	method efecto(){
		
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlEste(false)
		 }
							
}
class ParedArriba {
	var property position 
	
	method image() = "ParedArriba.png"
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	method efecto(){
		
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(false)
	}
}
/*class ParedAbajo {
	var property position 
	
	method image() = "ParedAbajo.png"
	
	method redireccionarElemento(unaPelota) {}
	
	method efecto(){
		game.boardGround("FondeGameOver.png")
	}
	method cambiarBrujula(unaPelota) {}
}*/