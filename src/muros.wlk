import orientacion.*

class ParedIzq {
	var property position 
	
	method image() = "ParedIzq.png"
	
	method rebotar(unaPelota) = if(unaPelota.vaAlNorte())  norEste else surEste
	
	method efecto(){
		
	}
	method cambiarPanorama(unaPelota) {
		 unaPelota.vaAlEste(true)
		 }
}
class ParedDer {
	var property position 
	
	method image() = "ParedDer.png"
	
	method rebotar(unaPelota) =   if(unaPelota.vaAlNorte())  norOeste else surOeste
	
	method efecto(){
		
	}
	method cambiarPanorama(unaPelota) {
		 unaPelota.vaAlEste(false)
		 }
								
}
class ParedArriba {
	var property position 
	
	method image() = "ParedArriba.png"
	
	method rebotar(unaPelota) = if(unaPelota.vaAlEste())  surEste else surOeste
	
	method efecto(){
		
	}
	method cambiarPanorama(unaPelota) {
		 unaPelota.vaAlNorte(false)
		 }
}
class ParedAbajo {
	var property position 
	
	method image() = "ParedAbajo.png"
	
	
}