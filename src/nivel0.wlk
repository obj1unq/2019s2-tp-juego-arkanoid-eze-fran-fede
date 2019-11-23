import wollok.game.*
import muros.*
import bloques.*
import pelota.*
import barra.*
import poderes.*
import direcciones.*

object nivel0 {
	var property vidas = 3
	
	var barra2 = new Barra(position = new Position(x = 9, y = 0))
	
	var barra1 = new Barra(position = new Position(x = barra2.position().x() - 1, y = 0))
	
	var barra3 = new Barra(position = new Position(x = barra2.position().x() + 1, y = 0))
	
	var property barraChicaActivada = false
	
	var property numeroDeBloques
	
	method gameOver() = if(self.vidas() == 0) game.stop()
						else {}
	
	
	method gameWon() = if(numeroDeBloques == 0)	game.stop()	
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
	
	method agregarVida(){
		vidas += 1
	}

	
	method cargar() {
	
 		const ancho = game.width() - 1
		const largo = game.height() - 1
//	PAREDES
	
		var posParedesArriba = []
		var posParedesDerecha = []
		var posParedesIzquierda = []
		
		(0 .. ancho).forEach{ n => posParedesArriba.add(new Position(x=n, y=largo)) } // bordeArriba 
		
		(1 .. largo).forEach{ n => posParedesDerecha.add(new Position(x=ancho, y=n)) } // bordeDer
	
		(1 .. largo).forEach{ n => posParedesIzquierda.add(new Position(x=0, y=n)) } // bordeIzq 
		
		

		posParedesArriba.forEach { p => self.dibujarCelda(new ParedArriba(position = p))}	
		
		posParedesDerecha.forEach { p => self.dibujarCelda(new ParedDer(position = p))}	
		
		posParedesIzquierda.forEach { p => self.dibujarCelda(new ParedIzq(position = p))}	
		
//	BLOQUES

 
		var primeraFilaBloques = []
		var segundaFilaBloques = []
		var tercerFilaBloques = []
		(1 .. ancho-1).forEach{n => primeraFilaBloques.add(new Position(x=n, y=largo-1))}
		
		(1 .. ancho-1).forEach{n => segundaFilaBloques.add(new Position(x=n, y=largo-2))}
		
		(1 .. ancho-1).forEach{n => tercerFilaBloques.add(new Position(x=n, y=largo-3))}
		
		primeraFilaBloques.forEach { p => self.dibujarBloque(new BloqueAmarillo(position = p))}	
		
		segundaFilaBloques.forEach { p => self.dibujarBloque(new BloqueFucsia(position = p))}
		
		tercerFilaBloques.forEach { p => self.dibujarBloque(new BloqueAzul(position = p))}
		
		
		self.numeroDeBloques(primeraFilaBloques.size() + segundaFilaBloques.size() + tercerFilaBloques.size())
		

				
		game.addVisual(pelota)
		
		self.dibujarBarra(barra1)
		self.dibujarBarra(barra2)
		self.dibujarBarra(barra3)
		
		game.onTick(200, "movimiento", { pelota.siguientePosicion()
										 self.descontarVida()
										 self.gameOver()
										 self.gameWon()
										})
									
		game.onCollideDo(barra1, {objeto => objeto.efectoPowerUp()})
		game.onCollideDo(barra2, {objeto => objeto.efectoPowerUp()})
		game.onCollideDo(barra3, {objeto => objeto.efectoPowerUp()})
		

	}
	method dibujarCelda(dibujo){
		game.addVisual(dibujo)
		
	}
	

	method dibujarBloque(dibujo) {
		game.addVisual(dibujo)
	}

	
	method dibujarBarra(dibujo){
		game.addVisual(dibujo)
		keyboard.right().onPressDo { dibujo.nuevaPosision(este.cambiarPosicion(dibujo.position())) }
		keyboard.left().onPressDo { dibujo.nuevaPosision(oeste.cambiarPosicion(dibujo.position())) }
	}
	
	method colocarBarraChica(){
		
		game.removeVisual(barra1)
		game.removeVisual(barra3)
	}
/*	
	method colocarBarraNormal(){
		game.addVisual(barra1)
		game.addVisual(barra3)
	}
*/
	method unoBloqueMenos(){
		numeroDeBloques -= 1
	}
	
}
