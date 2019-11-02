object norEste{
	var property orienta
	
	method indicacion(posicionActual){
			orienta = posicionActual.up(1).right(1)
	}
}
object norOeste{
	var property orienta
	
	method indicacion(posicionActual){
			orienta = posicionActual.up(1).left(1)
	}
}
object surEste{
	var property orienta
	
	method indicacion(posicionActual){
			orienta = posicionActual.down(1).right(1)
	}
}
object surOeste{
	var property orienta
	
	method indicacion(posicionActual){
			orienta = posicionActual.down(1).left(1)
	}
}