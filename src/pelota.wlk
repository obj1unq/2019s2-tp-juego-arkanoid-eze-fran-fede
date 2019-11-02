import wollok.game.*
import orientacion.*

object pelota{
	var property position = new Position(x = 2, y = 2)
	var property orientacion = norEste

	method image() = "PelotaAzul0.png"


	method moverse(){
		orientacion.indicacion(position)
		position = orientacion.orienta()
	}

	method cambiarDireccion(unaOrientacion){
		orientacion = unaOrientacion
	}
}