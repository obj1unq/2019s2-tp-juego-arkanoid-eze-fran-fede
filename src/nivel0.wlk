import wollok.game.*
import muros.*
import bloques.*
import pelota.*
import barra.*
import poderes.*
import direcciones.*

object nivel0 {
	var property vidas = 3
	
	var property tiros = 0
	
	var barraMedio = new Barra(position = new Position(x = 9, y = 0))
	
	var barra1Izq = new Barra(position = new Position(x = barraMedio.position().x() - 1, y = 0))
	
	var barra1Der = new Barra(position = new Position(x = barraMedio.position().x() + 1, y = 0))
/* 	
	var barra2Izq = new Barra(position = new Position(x = barraMedio.position().x() - 2, y = 0))
	
	var barra2Der = new Barra(position = new Position(x = barraMedio.position().x() + 2, y = 0))
*/	
	var property barraChicaActivada = false
	
	var property numeroDeBloques
	
	var property barraBorracha = false
	
	var property direccionEste = este
	
	var property direccionOeste = oeste 
	
	var property activadoTresPelotas = false
	
	var property pelotaAzul = new Pelota(position = new Position(x = 3, y = 3), imagen = "PelotaAzul.png")
	
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

		if(pelotaAzul.positionY() == 0 ) {
			vidas -= 1
			pelotaAzul.position(new Position(x = 3, y = 3))
			pelotaAzul.direccion (norEste)
			pelotaAzul.vaAlNorte(true)
			pelotaAzul.vaAlEste(true)
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
		(1 .. ancho/2).forEach{n => primeraFilaBloques.add(new Position(x=n, y=largo-1))}
		
		(ancho/2 + 1 .. ancho-1).forEach{n => segundaFilaBloques.add(new Position(x=n, y=largo-1))}
		
		(1 .. ancho-1).forEach{n => tercerFilaBloques.add(new Position(x=n, y=largo-2))}
		
		primeraFilaBloques.forEach { p => self.dibujarCelda(new BloqueAmarillo(position = p))}	
		
		segundaFilaBloques.forEach { p => self.dibujarCelda(new BloqueFucsia(position = p))}
		
		tercerFilaBloques.forEach { p => self.dibujarCelda(new BloqueAzul(position = p))}
		
		
		self.numeroDeBloques(primeraFilaBloques.size() + segundaFilaBloques.size() + tercerFilaBloques.size())
		
// 	BARRA
				
		game.addVisual(pelotaAzul)
		
		self.dibujarBarra(barraMedio)
		self.dibujarBarra(barra1Izq)
		self.dibujarBarra(barra1Der)
		
//  INTERACCION
		
		game.onTick(100, "movimientoDeLaPelota", { pelotaAzul.siguientePosicion()
													 self.descontarVida()
													 self.gameOver()
										 			 self.gameWon()
										})
									
		game.onCollideDo(barraMedio, {objeto => objeto.efectoPowerUp()})
		game.onCollideDo(barra1Izq, {objeto => objeto.efectoPowerUp()})
		game.onCollideDo(barra1Der, {objeto => objeto.efectoPowerUp()})
/*		
		game.whenCollideDo(barra2Izq, {objeto => objeto.efectoPowerUp()})
		game.onCollideDo(barra2Der, {objeto => objeto.efectoPowerUp()})
*/
	}
	
	method dibujarCelda(dibujo){
		game.addVisual(dibujo)
	}
	
	method dibujarBarra(dibujo){
		game.addVisual(dibujo)
		self.configurarTeclasNormal(dibujo)
	}
	
	method cambiarDireccion(){
		direccionEste = oeste
		direccionOeste = este
		}
	
	method direccionNormal(){
		direccionEste = este
		direccionOeste = oeste
	}	
	

	method configurarTeclasNormal(dibujo){
		keyboard.right().onPressDo { dibujo.nuevaPosisionEste(direccionEste.cambiarPosicion(dibujo.position())) }
		keyboard.left().onPressDo { dibujo.nuevaPosisionOeste(direccionOeste.cambiarPosicion(dibujo.position())) }
	}
	

	method colocarBarraChica(){
		
		game.removeVisual(barra1Izq)
		game.removeVisual(barra1Der)
	}
	
	method colocarBarraNormal(){
		game.addVisual(barra1Izq)
		game.addVisual(barra1Der)
		
	}
/* 	
	method colocarBarraGrande(){
		game.addVisual(barra2Izq)
		game.addVisual(barra2Der)
	}
*/
	method unoBloqueMenos(){
		numeroDeBloques -= 1
	}
	method unoBloqueMas(){
		numeroDeBloques += 1
	}
	
	method barraTieneLaser(){
		keyboard.a().onPressDo{ barraMedio.disparar() }
	}
	
	method gastarTiros(){
	tiros -= 1
	}
	
	method sumarTiros(){
	tiros +=5
	}	
	
	
	method agregarDosPelotas(){
		var pelotaNaranja = new Pelota(position = new Position(x = 9, y = 3), imagen = "PelotaNaranja.png") 
		game.addVisual(pelotaNaranja)
		game.onTick(200, "movimientoDeLaPelotaNaranja", { pelotaNaranja.siguientePosicion() } )
		
		var pelotaNaranja2 = new Pelota(position = new Position(x = 3, y = 3), imagen = "PelotaNaranja.png") 
		game.addVisual(pelotaNaranja2)
		game.onTick(200, "movimientoDeLaPelotaNaranja", { pelotaNaranja2.siguientePosicion() } )
		
		activadoTresPelotas = true
		
		
//		game.addVisual(pelotaAzul)
	}
	
	
	
}