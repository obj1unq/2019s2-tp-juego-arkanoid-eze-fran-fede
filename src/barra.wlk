import wollok.game.*
import direcciones.*


<<<<<<< HEAD
object barra{
	var property position = new Position(x = 4, y = 1)
	var property borracha = false
=======
class Barra{
	var property position 
	
>>>>>>> branch 'master' of https://github.com/obj1unq/2019s2-tp-juego-arkanoid-eze-fran-fede.git
	method image() = "BarraNormal0.png"
	
	
	method irAIzquierda(nuevaPosicion) {
		position = game.at(1.max(nuevaPosicion.x()), nuevaPosicion.y())
		}
		
	method irADerecha(nuevaPosicion) {
		position = game.at(8.min(nuevaPosicion.x()), nuevaPosicion.y())
		}
		
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  norEste else norOeste 
	
	method efecto(){
		game.sound("Golpe_01.wav")
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(true)
	}
	
	method nuevaPosision(unaPosicion){		
		position = unaPosicion		
		
	}
	
	method efectoPowerUp() {}
}

