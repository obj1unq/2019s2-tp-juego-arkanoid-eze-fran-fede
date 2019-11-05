object norEste{
	var property nuevaPosicion
	
	method nuevaPosicion(posicionActual){
			nuevaPosicion = posicionActual.up(1).right(1)
	}
}
object norOeste{
	var property nuevaPosicion
	
	method nuevaPosicion(posicionActual){
			nuevaPosicion = posicionActual.up(1).left(1)
	}
}
object surEste{
	var property nuevaPosicion
	
	method nuevaPosicion(posicionActual){
			nuevaPosicion = posicionActual.down(1).right(1)
	}
}
object surOeste{
	var property nuevaPosicion
	
	method nuevaPosicion(posicionActual){
			nuevaPosicion = posicionActual.down(1).left(1)
	}
}