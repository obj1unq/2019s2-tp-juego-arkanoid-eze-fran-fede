import wollok.game.*
import direcciones.*


object barra{
	var property position = new Position(x = 4, y = 0)
	
	method image() = "BarraNormal0.png"
	
	method redireccionarElemento(unaPelota) = if(unaPelota.vaAlEste())  norEste else norOeste
	
	method efecto(){
		
	}
	method cambiarBrujula(unaPelota) {
		 unaPelota.vaAlNorte(true)
		 }
}