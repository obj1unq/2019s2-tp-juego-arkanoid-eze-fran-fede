import wollok.game.*
import direcciones.*
import barra.*

object pelota{
	var property position = new Position(x = barra.position().x(), y = 1)
	var property direccion = norEste
	
	var property vaAlNorte = true
	var property vaAlEste = true

	method image() = "PelotaAzul0.png"


	method siguientePosicion(){
		direccion.nuevaPosicion(position)
		position = direccion.nuevaPosicion()
	}

	method cambiarDeDireccion(unaDireccion){
		direccion = unaDireccion
	}
	
	method perdi() = self.position() == self.ubicacionPerdi(not barra.position().x(), 0)
					
	
	method ubicacionPerdi(x,y) = game.at(x, y)
	
	
}