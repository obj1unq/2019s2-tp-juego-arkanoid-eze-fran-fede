import wollok.game.*
import direcciones.*
import nivel0.*

class Poder {
	
	var property position 
	
	method image()
	
	method redireccionarElemento(unaPelota) = unaPelota.direccion()
	
	method efecto(){}
	
	method moverse(){
		game.onTick(400, "movimientoPoder", { self.position(sur.cambiarPosicion(position)) })
	}
	method efectoPowerUp()
	
	method cambiarBrujula(unaPelota) {}
}

class ExtraVida inherits Poder{
	
	override method image() = "Poder_01_ExtraVida.png"
	
	override method efectoPowerUp(){
		nivel0.agregarVida()
	}
}

class Encoger inherits Poder{
	
	override method image() = "Poder_04_Encoger.png"
	
	override method efectoPowerUp(){
		
		if(not nivel0.barraChicaActivada()){
			nivel0.colocarBarraChica()
			nivel0.barraChicaActivada(true)
		}
	}
}



class Expandir inherits Poder{
	
	override method image() = "Poder_03_Expandir.png"
	
	override method efectoPowerUp(){
 		
		if(nivel0.barraChicaActivada()){
			nivel0.colocarBarraNormal()
			nivel0.barraChicaActivada(false)
		}else{
			
			
		}
		
		
		
			
		
	}
}

/*
class TripleBola inherits Poder{
	
	override method image() = "Poder_02_TripleBola.png"
	
	override method efectoPowerUp(){
	
	
	}
}
/*
class Laser inherits Poder{
	
	override method image() = "Poder_05_Laser.png"
	
	override method efectoPowerUp(){
		
	}
}
class Borracha inherits Poder{
	
	override method image() = "Poder_06_Borracha.png"
	
	override method efectoPowerUp(){
		
	}
}
*/
