import wollok.game.*
import muros.*
import bloques.*
import barra.*
import direcciones.*
import poderes.*

class Pelota{
	var property position 
	var property direccion = norEste
	var property imagen
	
	var property vaAlNorte = true
	var property vaAlEste = true

	method image() = imagen 


	method siguientePosicion()
	{
		direccion.generarPosiblesPosiciones(position)
		
		var posicionEnDiagonal = direccion.proximaPosicionDiagonal()
		var posicionEnVertical = direccion.proximaPosicionVertical()
		var posicionEnHorizontal = direccion.proximaPosicionHorizontal()

		
		if ( self.puedePasarLaPelota(posicionEnVertical) and self.puedePasarLaPelota(posicionEnHorizontal) 
															and self.puedePasarLaPelota(posicionEnDiagonal) 
			)
			{
					 position = posicionEnDiagonal
				
			}
			
			else	{			
					
					if(self.hayObjetoEnPosicion(posicionEnDiagonal) and not self.hayObjetoEnPosicion(posicionEnVertical) and not self.hayObjetoEnPosicion(posicionEnHorizontal)) 
					{
						
					self.cambiarParametrosPorColision(posicionEnDiagonal)
					
						}
					
					if(self.hayObjetoEnPosicion(posicionEnVertical)) 
						{
						
					self.cambiarParametrosPorColision(posicionEnVertical)
					
						}
					if(self.hayObjetoEnPosicion(posicionEnHorizontal)) 
					{
						
					self.cambiarParametrosPorColision(posicionEnHorizontal)
					
					}		
						
				}	
	}
	
	method cambiarDeDireccion(unaDireccion){
		direccion = unaDireccion
	}
	
	method noHayObjetoEnPosicion(unaPosicion) = game.getObjectsIn(unaPosicion).isEmpty() 
	
	method hayObjetoEnPosicion(unaPosicion) = not game.getObjectsIn(unaPosicion).isEmpty()
	
	method puedePasarLaPelota(unaPosicion) = if (self.hayObjetoEnPosicion(unaPosicion)) game.getObjectsIn(unaPosicion).first().sePuedeTranspasar() else true
	
	method cambiarParametrosPorColision(unaPosicion){
		var objetoPorColisionar = game.getObjectsIn(unaPosicion).first()
		
		objetoPorColisionar.cambiarBrujula(self) 
			
		self.cambiarDeDireccion(objetoPorColisionar.redireccionarElemento(self)) 
					
		objetoPorColisionar.efecto()
	}
	
	method positionY() =  position.y()
	
	method sePuedeTranspasar() = true
	
	method cambiarBrujula(unaPelota) {}
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  norEste else norOeste 
	
	method efecto(){}
	
	method efectoPowerUp() {}
	
}