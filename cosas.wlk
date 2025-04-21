object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object auto{}
object robot{}

object bumblebee{
	var property transformacion = auto

	method peso() = 800
	method nivelPeligrosidad() = if(transformacion == auto){15} else {30}
}

object paqueteDeLadrillos{
	var property cantidad = 1
	const pesoPorLadrillo = 2

	method peso() = cantidad * pesoPorLadrillo
	method nivelPeligrosidad() = 2
}

object arenaAGranel{
	var property peso = 0
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var property tieneMisiles = false

	method peso() = if(tieneMisiles){300} else {200}
	method nivelPeligrosidad() = if(tieneMisiles){100} else {0}
}

object contenedorPortuario{
	const property cosas = []
	const pesoPropio = 100

	method peso() = pesoPropio + cosas.sum({c => c.peso()})
	method nivelPeligrosidad() = if(cosas.isEmpty()){0} else {cosas.max({c => c.nivelPeligrosidad()})}
}

object residuosRadiactivos{
	var property peso = 0
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad{
	var property cosa = null

	method peso() = if(cosa == null){0} else {cosa.peso()}
	method nivelPeligrosidad() = if(cosa == null){0} else {cosa.nivelPeligrosidad()}
}