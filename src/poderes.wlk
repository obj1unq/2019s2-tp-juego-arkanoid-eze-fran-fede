import wollok.game.*
import direcciones.*

class Poder {
	
	var property position // = new Position(x = 2, y = 2)
	
	method image()
	
	method redireccionarElemento(unaPelota) = unaPelota.direccion()
	
	method efecto(){}
	
	method moverse(){
		game.onTick(400, "movimientoPoder", { self.position(sur.cambiarPosicion(position)) })
	}
	method efectoPowerUp()
	
	method cambiarBrujula(unaPelota) {}
}

class ExtraVida inherits Poder{
	
	override method image() = "Poder_01_ExtraVida.png"
	
	override method efectoPowerUp(){
		game.say(self, "rock")
	}
}

