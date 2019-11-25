import wollok.game.*
import direcciones.*
import laser.*
import nivel0.*


class Barra{
	var property position 
	
	method image() = "BarraNormal0.png"
	
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
	
	method sePuedeTranspasar() = false
	
	method disparar(){
	
		var nuevoLaser = new Laser(position = new Position(x = position.x(), y = 1))
		if(nivel0.tiros() > 0){
			
		game.sound("laser1.wav")
		game.addVisual (nuevoLaser)
		nuevoLaser.moverse()
		nivel0.gastarTiros()
	}
	}
}