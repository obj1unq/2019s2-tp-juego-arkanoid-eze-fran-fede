import wollok.game.*
import orientacion.*


object barra{
	var property position = new Position(x = 4, y = 0)
	
	method image() = "BarraNormal0.png"
	
	method rebotar(unaPelota) = if(unaPelota.vaAlEste())  norEste else norOeste
	
	method efecto(){
		
	}
	method cambiarPanorama(unaPelota) {
		 unaPelota.vaAlNorte(true)
		 }
}