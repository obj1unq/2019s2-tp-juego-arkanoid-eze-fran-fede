object norEste{
	var property nuevaPosicion
	var property choque1
	var property choque2
	
	method alterarPosicion(posicionActual){
			nuevaPosicion = posicionActual.up(1).right(1)
			choque1 = posicionActual.right(1)
			choque2 = posicionActual.up(1)
	}

}
object norOeste{
	var property nuevaPosicion
	var property choque1
	var property choque2
	
	method alterarPosicion(posicionActual){
			nuevaPosicion = posicionActual.up(1).left(1)
			choque1 = posicionActual.up(1)
			choque2 = posicionActual.left(1)
	}
}

object surOeste{
	var property nuevaPosicion
	var property choque1
	var property choque2
	
	method alterarPosicion(posicionActual){
			nuevaPosicion = posicionActual.down(1).left(1)
			choque1 = posicionActual.left(1)
			choque2 = posicionActual.down(1)
	}
}
object surEste{
	var property nuevaPosicion
	var property choque1
	var property choque2
	
	method alterarPosicion(posicionActual){
			nuevaPosicion = posicionActual.down(1).right(1)
			choque1 = posicionActual.down(1)
			choque2 = posicionActual.right(1)
	}
}