object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var esAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() = if(esAuto){15}else{30} 
	method cambiarEstado() { esAuto = !esAuto }
}

object paqueteLadrillos{
	var property cantLadrillos = 0
	
	method peso() = 2 * cantLadrillos
	method nivelPeligrosidad() = 2
}


object arena {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var estaConMisiles = true
	
	method peso() = if(estaConMisiles){300}else{200}
	method nivelPeligrosidad() = if(estaConMisiles){100}else{0}
	method cambiarEstadoMisiles() { estaConMisiles = not estaConMisiles }
}

object contenedor {
	const cosas = []
	
	method peso() = 100 + cosas.sum({ c => c.peso() })
	method mayorPeligrosidad() = cosas.max({ c => c.nivelPeligrosidad() })
	method nivelPeligrosidad() = 
		if(cosas.isEmpty()){0}else{self.mayorPeligrosidad().nivelPeligrosidad()}
	method agregarCosa(unObjeto) { cosas.add(unObjeto) }
	method sacarCosa(unObjeto) { cosas.remove(unObjeto) }
	
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() = 200
}

object embalajeSeguridad {
	var property objeto 
	
	method peso() = objeto.peso() 
	method nivelPeligrosidad(cosa) = cosa.nivelPeligrosidad() / 2
}




