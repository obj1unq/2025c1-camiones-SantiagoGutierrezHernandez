import cosas.*

object camion {
	const kilosDelCamion = 1000
	const kilosMaximos = 2500
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa){
		cosas.remove(cosa)
	}

	method todoPesoPar(){
		return cosas.all({c => c.peso() % 2 == 0})
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({c => c.peso() == peso})
	}

	method elDeNivel(nivel){
		return cosas.filter({c => c.nivelPeligrosidad() == nivel}).first()
	}

	method pesoTotal(){
		return kilosDelCamion + cosas.sum({c => c.peso()})
	}

	method excedidoDePeso(){
		return self.pesoTotal() > kilosMaximos
	}

	method esMasPeligrosoQue(nivelA, nivelB){
		return nivelA > nivelB
	}

	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({c => self.esMasPeligrosoQue(c.nivelPeligrosidad(), nivel)})
	}

	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())	
	} 

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return !self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
}
