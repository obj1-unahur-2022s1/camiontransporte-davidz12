import cosas.*

object camion {
	const cosas = []
	
	method cargar(cosa) {cosas.add(cosa)}
	
	method descargar(cosa) {cosas.remove(cosa)}
	
	method todoPesoPar() = cosas.all({ c => c.peso().even() })
	
	method hayAlgunoQuePesa(peso) = cosas.any({ c => c.peso() == peso })
	
	method elDeNivel(nivel) = cosas.find({ c => c.nivelPeligrosidad() == nivel })
	
	method pesoTotal() = cosas.sum({ c => c.peso() }) + self.pesoCamionVacio()
	method pesoCamionVacio() = 1000
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) =
		 cosas.filter({ c => c.nivelPeligrosidad() > nivel })
		 
	method objetosMasPeligrososQue(cosa) =	
		 self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
		 
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) =
		 !self.excedidoDePeso() and
		 self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	
	method tieneAlgoQuePesaEntre(min, max) =
		 cosas.any({ c => c.peso().between(min,max) })
		 
	method cosaMasPesada() = cosas.max({ c => c.peso() })
	
	method pesos() = cosas.map({ c => c.peso() })
}

