import wollok.game.*
import orientacion.*
import barra.*

object pelota{
	var property position = new Position(x = barra.position().x(), y = 1)
	var property orientacion = norEste
	
	var property vaAlNorte = true
	var property vaAlEste = true

	method image() = "PelotaAzul0.png"


	method moverse(){
		orientacion.nuevaPosicion(position)
		position = orientacion.orienta()
	}

	method cambiarDeOrientacion(unaOrientacion){
		orientacion = unaOrientacion
	}
}