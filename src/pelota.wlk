import wollok.game.*
import orientacion.*
import barra.*

object pelota{
	var property position = new Position(x = barra.position().x(), y = 1)
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