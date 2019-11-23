import wollok.game.*
import muros.*
import bloques.*
import pelota.*
import barra.*
import poderes.*
import direcciones.*

object nivel0 {
	var property vidas = 3
	
	method gameOver() = if(self.vidas() == 0) game.stop()
						else {}
						
/* 	
		method gameOver() = if(self.vidas() == 0) { 
							game.boardGround("FondeGameOver.png")
		//					game.onTick(3000, "gameOver", game.stop())
							}
						else {}
*/	
	
 	method descontarVida(){

		if(pelota.positionY() == 0 ) {
			vidas -= 1
			pelota.position(new Position(x = 3, y = 3))
			pelota.direccion (norEste)
			pelota.vaAlNorte(true)
			pelota.vaAlEste(true)
			}
	}

	
	method cargar() {
	
 		const ancho = game.width() - 1
		const largo = game.height() - 1
//	PAREDES
	
		var posParedesArriba = []
		var posParedesDerecha = []
		var posParedesIzquierda = []
//		var posParedesAbajo = []
		
		(0 .. ancho).forEach{ n => posParedesArriba.add(new Position(x=n, y=largo)) } // bordeArriba 
		
		(0 .. largo).forEach{ n => posParedesDerecha.add(new Position(x=ancho, y=n)) } // bordeDer
	
		(0 .. largo).forEach{ n => posParedesIzquierda.add(new Position(x=0, y=n)) } // bordeIzq 
		
//		(0 .. ancho).forEach{ n => posParedesAbajo.add(new Position(x=n, y=0)) } // bordeAbajo 
		

		posParedesArriba.forEach { p => self.dibujarCelda(new ParedArriba(position = p))}	
		
		posParedesDerecha.forEach { p => self.dibujarCelda(new ParedDer(position = p))}	
		
		posParedesIzquierda.forEach { p => self.dibujarCelda(new ParedIzq(position = p))}	
		
//		posParedesAbajo.forEach { p => self.dibujarCelda(new ParedAbajo(position = p))}	
		
//	BLOQUES

 
		var primeraFilaBloques = []
		var segundaFilaBloques = []
		var tercerFilaBloques = []
		(1 .. 8).forEach{n => primeraFilaBloques.add(new Position(x=n, y=largo-1))}
		
		(1 .. 8).forEach{n => segundaFilaBloques.add(new Position(x=n, y=largo-2))}
		
		(1 .. 8).forEach{n => tercerFilaBloques.add(new Position(x=n, y=largo-3))}
		
		primeraFilaBloques.forEach { p => self.dibujarCelda(new BloqueAmarillo(position = p))}	
		
		segundaFilaBloques.forEach { p => self.dibujarCelda(new BloqueFucsia(position = p))}
		
		tercerFilaBloques.forEach { p => self.dibujarCelda(new BloqueAzul(position = p))}
		
				
		game.addVisual(pelota)		
		game.addVisualCharacter(barra)
//		game.addVisual(poder)
		
		game.onTick(200, "movimiento", { pelota.siguientePosicion()
										 self.descontarVida()
										 self.gameOver()
										})
										
		game.onCollideDo(barra, {objeto => objeto.efectoPowerUp()})
	
	}

	method dibujarCelda(dibujo) {
		game.addVisual(dibujo)
	}
	
}
