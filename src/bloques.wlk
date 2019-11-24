import direcciones.*
import wollok.game.*
import poderes.*
import nivel0.*

class Bloques{
	var property position 
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	method efecto(){
		game.removeVisual(self)	
		game.sound("Golpe_03.wav")
		nivel0.unoBloqueMenos()
	}
	
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(false)
	 }
	 
	 method sePuedeTranspasar() = false
	
}

class BloqueAmarillo inherits Bloques{
	
	method image() = "BloqueAmarillo.png"
}

class BloqueAzul inherits Bloques{

	method image() = "BloqueAzul.png"
	
	override method efecto(){
		super()
		var nuevoPoder = self.generarBloqueAleatorio()
		game.addVisual(nuevoPoder)
		nuevoPoder.moverse()
		
	}
	
	method generarBloqueAleatorio(){
		return [new Encoger (position = self.position() ) , new ExtraVida (position = self.position() ),
				new Expandir (position = self.position() )			
		].anyOne()
	}
}

class BloqueFucsia inherits Bloques{
	
	method image() = "Bloquefucsia.png"
	
	override method efecto(){
		super()
		game.addVisual(new BloqueAzul( position = self.position()))	
	}
}