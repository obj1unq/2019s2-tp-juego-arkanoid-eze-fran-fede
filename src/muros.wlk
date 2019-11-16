import direcciones.*
import wollok.game.*


class Pared{
	var property position 
	
	method image()
	
	method redireccionarElemento(unaPelota)
	
	method efecto(){
		game.sound("Golpe_02.wav")
	}
	method cambiarBrujula(unaPelota) 
	
}

class ParedIzq inherits Pared{
	
	override method image() = "ParedIzq.png"
	
	override method redireccionarElemento(unaPelota) = if(unaPelota.vaAlNorte())  norEste else surEste
	
	override method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlEste(true)
		 }

}
class ParedDer inherits Pared{
	
	override method image() = "ParedDer.png"
	
	override method redireccionarElemento(unaPelota) =   if(unaPelota.vaAlNorte())  norOeste else surOeste
	
	override method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlEste(false)
		 }
							
}
class ParedArriba inherits Pared{

	
	override method image() = "ParedArriba.png"
	
	override method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	override method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(false)
	}
}
/*
class ParedAbajo inherits Pared{
	
	override method image() = "ParedAbajo.png"
	
	override method redireccionarElemento(unaPelota) {}
	
	override method efecto(){
		
	}
	override method cambiarBrujula(unaPelota) {}
}

*/