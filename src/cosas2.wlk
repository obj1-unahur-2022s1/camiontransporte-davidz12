object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	method cantBultos() = 1
	method sufrirConsecuencia() {}
}

object bumblebee {
	var esAuto = true
	
	method peso() = 800
	method nivelPeligrosidad() = if(esAuto){15}else{30} 
	method cambiarEstado() { esAuto = !esAuto }
	method cantBultos() = 2
	method sufrirConsecuencia() {self.cambiarEstado()}
}

object paqueteLadrillos{
	var property cantLadrillos = 0
	
	method peso() = 2 * cantLadrillos
	method nivelPeligrosidad() = 2
	method cantBultos() = if(self.cantLadrillos().between(1,100)){1}
														else if(self.cantLadrillos().between(101,300)){2}
														else{3}
	method sufrirConsecuencia() {cantLadrillos += 12}
}


object arena {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	method cantBultos() = 1
	method sufrirConsecuencia() {peso += 20}
}

object bateriaAntiaerea {
	var estaConMisiles = true
	
	method peso() = if(estaConMisiles){300}else{200}
	method nivelPeligrosidad() = if(estaConMisiles){100}else{0}
	method cambiarEstadoMisiles() { estaConMisiles = not estaConMisiles }
	method cantBultos() = if(!estaConMisiles){1}else{2}
	method sufrirConsecuencia() {if(!estaConMisiles){self.cambiarEstadoMisiles()}}
}

object contenedor {
	const cosas = []
	
	method peso() = 100 + cosas.sum({ c => c.peso() })
	method mayorPeligrosidad() = cosas.max({ c => c.nivelPeligrosidad() })
	method nivelPeligrosidad() = 
		if(cosas.isEmpty()){0}else{self.mayorPeligrosidad().nivelPeligrosidad()}
	method agregarCosa(unObjeto) { cosas.add(unObjeto) }
	method sacarCosa(unObjeto) { cosas.remove(unObjeto) }
	method cantBultos() = 1 + cosas.sum({ c => c.cantBultos() })
	method sufrirConsecuencia() {cosas.map({ c => c.sufrirConsecuencia() })}
	
}

object residuosRadioactivos {
	var property peso = 0
	method nivelPeligrosidad() = 200
	method cantBultos() = 1
	method sufrirConsecuencia() {peso += 15}
}

object embalajeSeguridad {
	var property objeto 
	
	method peso() = objeto.peso() 
	method nivelPeligrosidad(cosa) = cosa.nivelPeligrosidad() / 2
	method cantBultos() = 2
	method sufrirConsecuencia() {}
}




