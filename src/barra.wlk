import wollok.game.*
import direcciones.*


object barra{
	var property position = new Position(x = 4, y = 1)
	var property borracha = false
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
}