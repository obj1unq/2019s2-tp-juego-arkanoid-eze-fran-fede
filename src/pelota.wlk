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


	method siguientePosicion(){
		direccion.alterarPosicion(position)
		
		var posicionParaChocar1 = direccion.choque1()
		var posicionParaChocar2 = direccion.choque2()

		
		if ( self.noHayObjetoEnPosicion(posicionParaChocar1) and self.noHayObjetoEnPosicion(posicionParaChocar2) )
			{
					 position = direccion.nuevaPosicion()
				
			}
			
			else{			
					
					if(self.hayObjetoEnPosicion(posicionParaChocar1)) {
						
					self.cambiarParametrosPorColision(posicionParaChocar1)
					
					}else{
						
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