import wollok.game.*
import muros.*
import bloques.*
import barra.*
import direcciones.*

object pelota{
	var property position = new Position(x = 3, y = 3)
	var property direccion = norEste
	
	var property vaAlNorte = true
	var property vaAlEste = true

	method image() = "PelotaAzul.png"


	method siguientePosicion()
	{
		direccion.generarPosiblesPosiciones(position)
		
		var posicionParaChocar1 = direccion.posicionChoque1()
		var posicionParaChocar2 = direccion.posicionChoque2()
		
		var posicionEnDiagonal = direccion.posicionDiagonal()

		
		if ( self.noHayObjetoEnPosicion(posicionParaChocar1) and self.noHayObjetoEnPosicion(posicionParaChocar2) and self.noHayObjetoEnPosicion(posicionEnDiagonal) )
			{
					 position = posicionEnDiagonal
				
			}
			
			else	{			
					
					if(self.hayObjetoEnPosicion(posicionEnDiagonal) and not self.hayObjetoEnPosicion(posicionParaChocar1) and not self.hayObjetoEnPosicion(posicionParaChocar2)) 
					{
						
					self.cambiarParametrosPorColision(posicionEnDiagonal)
					
						}
					
					if(self.hayObjetoEnPosicion(posicionParaChocar1)) 
						{
						
					self.cambiarParametrosPorColision(posicionParaChocar1)
					
						}
					if(self.hayObjetoEnPosicion(posicionParaChocar2)) 
					{
						
					self.cambiarParametrosPorColision(posicionParaChocar2)
					
					}
					
						
				}	
	}
	
	method cambiarDeDireccion(unaDireccion){
		direccion = unaDireccion
	}
	
	method noHayObjetoEnPosicion(unaPosicion) = game.getObjectsIn(unaPosicion).isEmpty()
	
	method hayObjetoEnPosicion(unaPosicion) = not game.getObjectsIn(unaPosicion).isEmpty()
	
	method cambiarParametrosPorColision(unaPosicion){
		var objetoPorColisionar = game.getObjectsIn(unaPosicion).first()
		
		objetoPorColisionar.cambiarBrujula(self) 
			
		self.cambiarDeDireccion(objetoPorColisionar.redireccionarElemento(self)) 
					
		objetoPorColisionar.efecto()
	}

	
	method perdi() = self.position() == self.ubicacionPerdi(not barra.position().x(), 0)
					
	
	method ubicacionPerdi(x,y) = game.at(x, y)
	
	
}