object norEste{
	var property posicionDiagonal
	var property posicionChoque1
	var property posicionChoque2
	
	method generarPosiblesPosiciones(posicionActual){
			posicionDiagonal = posicionActual.up(1).right(1)
			posicionChoque1 = posicionActual.right(1)
			posicionChoque2 = posicionActual.up(1)
	}

}
object norOeste{
	var property posicionDiagonal
	var property posicionChoque1
	var property posicionChoque2
	
	method generarPosiblesPosiciones(posicionActual){
			posicionDiagonal = posicionActual.up(1).left(1)
			posicionChoque1 = posicionActual.up(1)
			posicionChoque2 = posicionActual.left(1)
	}
}

object surOeste{
	var property posicionDiagonal
	var property posicionChoque1
	var property posicionChoque2
	
	method generarPosiblesPosiciones(posicionActual){
			posicionDiagonal = posicionActual.down(1).left(1)
			posicionChoque1 = posicionActual.left(1)
			posicionChoque2 = posicionActual.down(1)
	}
}
object surEste{
	var property posicionDiagonal
	var property posicionChoque1
	var property posicionChoque2
	
	method generarPosiblesPosiciones(posicionActual){
			posicionDiagonal = posicionActual.down(1).right(1)
			posicionChoque1 = posicionActual.down(1)
			posicionChoque2 = posicionActual.right(1)
	}
}