object norEste{
	var property proximaPosicionDiagonal
	var property proximaPosicionVertical
	var property proximaPosicionHorizontal
	
	method generarPosiblesPosiciones(posicionActual){
			proximaPosicionDiagonal = posicionActual.up(1).right(1)
			proximaPosicionVertical = posicionActual.up(1)
			proximaPosicionHorizontal = posicionActual.right(1)
	}

}
object norOeste{
	var property proximaPosicionDiagonal
	var property proximaPosicionVertical
	var property proximaPosicionHorizontal
	
	method generarPosiblesPosiciones(posicionActual){
			proximaPosicionDiagonal = posicionActual.up(1).left(1)
			proximaPosicionVertical = posicionActual.up(1)
			proximaPosicionHorizontal = posicionActual.left(1)
	}
}

object surOeste{
	var property proximaPosicionDiagonal
	var property proximaPosicionVertical
	var property proximaPosicionHorizontal
	
	method generarPosiblesPosiciones(posicionActual){
			proximaPosicionDiagonal = posicionActual.down(1).left(1)
			proximaPosicionVertical = posicionActual.down(1)
			proximaPosicionHorizontal = posicionActual.left(1)
	}
}
object surEste{
	var property proximaPosicionDiagonal
	var property proximaPosicionVertical
	var property proximaPosicionHorizontal
	
	method generarPosiblesPosiciones(posicionActual){
			proximaPosicionDiagonal = posicionActual.down(1).right(1)
			proximaPosicionVertical = posicionActual.down(1)
			proximaPosicionHorizontal = posicionActual.right(1)
	}
}

object sur{
	
	method cambiarPosicion(posicionActual) = posicionActual.down(1)
}

object este{
	
	method cambiarPosicion(posicionActual) = posicionActual.right(1)
}

object oeste{
	
	method cambiarPosicion(posicionActual) = posicionActual.left(1)
}