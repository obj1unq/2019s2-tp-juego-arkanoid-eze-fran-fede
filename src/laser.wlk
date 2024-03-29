import wollok.game.*
import direcciones.*


class Laser {
	
	var property position
	
	method image() = "Laser.png"
	
	method moverse(){
		game.onTick(600, "movimientoLaser", { self.position(norte.cambiarPosicion(position)) 
												self.romperSiHayBloque()
		})
		//TODO: Pensar en aprovechar esto y evitar hacer el "romperSiHayBloque()" a mano
		game.onCollideDo(self, {objeto => objeto.efecto()})
		
	}
	
	method sePuedeTranspasar() = true
	
	method romperSiHayBloque(){
		var posicionNorte = norte.cambiarPosicion(position)
		if (self.hayObjetoEnPosicion(posicionNorte)) 
		{
		 	game.getObjectsIn(posicionNorte).first().efecto()
		}
	}
	
	method hayObjetoEnPosicion(unaPosicion) = not game.getObjectsIn(unaPosicion).isEmpty()
	
	method cambiarBrujula(unaPelota) {}
	method efecto(){}
	method redireccionarElemento(unaPelota) {}
	
	
}
