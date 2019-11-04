import wollok.game.*
import muros.*
import bloques.*
import pelota.*
import barra.*

object nivel0 {
	
method cargar() {
	
 		const ancho = game.width() - 1
		const largo = game.height() - 1
//	PAREDES
	
		var posParedesArriba = []
		var posParedesDerecha = []
		var posParedesIzquierda = []
		var posParedesAbajo = []
		
		(0 .. ancho).forEach{ n => posParedesArriba.add(new Position(x=n, y=largo)) } // bordeArriba 
		
		(0 .. largo).forEach{ n => posParedesDerecha.add(new Position(x=ancho, y=n)) } // bordeDer
	
		(0 .. largo).forEach{ n => posParedesIzquierda.add(new Position(x=0, y=n)) } // bordeIzq 
		
		(0 .. ancho).forEach{ n => posParedesAbajo.add(new Position(x=n, y=0)) } // bordeAbajo 
		

		posParedesArriba.forEach { p => self.dibujar(new ParedArriba(position = p))}	
		
		posParedesDerecha.forEach { p => self.dibujar(new ParedDer(position = p))}	
		
		posParedesIzquierda.forEach { p => self.dibujar(new ParedIzq(position = p))}	
		
		posParedesAbajo.forEach { p => self.dibujar(new ParedAbajo(position = p))}	
		
//	BLOQUES

 
		var primeraFilaBloques = []
		var segundaFilaBloques = []
		var tercerFilaBloques = []
		(1 .. 8).forEach{n => primeraFilaBloques.add(new Position(x=n, y=largo-1))}
		
		(1 .. 8).forEach{n => segundaFilaBloques.add(new Position(x=n, y=largo-2))}
		
		(1 .. 8).forEach{n => tercerFilaBloques.add(new Position(x=n, y=largo-3))}
		
		primeraFilaBloques.forEach { p => self.dibujar(new BloqueAmarillo(position = p))}	
		
		segundaFilaBloques.forEach { p => self.dibujar(new BloqueAzul(position = p))}
		
		tercerFilaBloques.forEach { p => self.dibujar(new BloqueFucsia(position = p))}
				
		game.addVisual(pelota)		
		game.addVisualCharacter(barra)
		
		game.onTick(500, "movimiento", { pelota.moverse()})
		
		game.whenCollideDo(pelota, {elemento => pelota.cambiarDireccion(elemento.rebotar())})
		game.whenCollideDo(pelota, {elemento => elemento.efecto()})
}

method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
}
