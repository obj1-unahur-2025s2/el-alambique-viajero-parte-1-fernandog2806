// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
// elAlambiqueViajero.wlk
object luke {
  const ciudades = [paris, buenosAires, bagdad, lasVegas]
  const ciudadesVisitadas = []
  const ultimoRecuerdo = []
  const vehiculos = []
  
  method cantidadDeLugaresVisitados() = ciudadesVisitadas.size()
  
  method recuerdoDelUltimoViaje() = ciudadesVisitadas.last().recuerdo()
  
  method ciudadesQueSeVisitaron(ciudadVisitada) {
    ciudadesVisitadas.add(ciudadVisitada)
  }
  
  method nuevoRecuerdo(ciudad, recuerdo) {
    ultimoRecuerdo.clear()
    ultimoRecuerdo.add([ciudad, recuerdo])
  }
  
  method agregarVehiculo(unVehiculo) {
    vehiculos.add(unVehiculo)
  }
  
  method viajarA(ciudad) {
    const vehiculo = vehiculos.last()
    if (ciudad.puedeSerVisitadaPor(vehiculo)) {
      self.nuevoRecuerdo(ciudad, ciudad.recuerdo())
      self.ciudadesQueSeVisitaron(ciudad)
      vehiculo.quitarCombustible(30)
    }
  }
}

object paris {
  method recuerdo() = "llavero torre eifel"
  
  method puedeSerVisitadaPor(unVehiculo) = unVehiculo.cantDeCombustible() > 30
}

object buenosAires {
  method recuerdo() {
    if (presidente.esCopado()) {
      return "mate con yerba"
    } else {
      return "mate sin yerba"
    }
  }
  
  method puedeSerVisitadaPor(unVehiculo) = unVehiculo.esRapido()
}

object presidente {
  var copado = true
  
  method esCopado() = copado
  
  method cambiarEstado() {
    copado = not copado
  }
}

object bagdad {
  method recuerdo() {
    if (historia.año() <= 1800) {
      return "bidon de petroleo"
    } else {
      if (historia.año().between(1801, 1900)) {
        return "replica de arma de destruccion masiva"
      } else {
        if (historia.año().between(1901, 2015)) {
          return "replica de los jardines colgantes"
        } else {
          return "regalo al azar"
        }
      }
    }
  }
  
  method puedeSerVisitadaPor(unVehiculo) = true
}

object historia {
  var año = 2000
  
  method año() = año
  
  method cambiarAño(nuevoAño) {
    año = nuevoAño
  }
}

object lasVegas {
  method ciudadHomenajeada() {
    if (dia.delHomenaje() == "9 de julio") {
      return buenosAires
    } else {
      if (dia.delHomenaje() == "14 de julio") {
        return paris
      } else {
        return bagdad
      }
    }
  }
  
  method recuerdo() = self.ciudadHomenajeada().recuerdo()
  
  method puedeSerVisitadaPor(
    unVehiculo
  ) = self.ciudadHomenajeada().puedeSerVisitadaPor(unVehiculo)
}

object dia {
  var diaDelHomenaje = "9 de julio"
  
  method delHomenaje() = diaDelHomenaje
  
  method cambiarDiaDelHomenaje(nuevoDia) {
    diaDelHomenaje = nuevoDia
  }
}

object alambique {
  var combustible = 100
  
  method cantDeCombustible() = combustible
  
  method esRapido() = self.cantDeCombustible() > 70
  
  method esLento() = not self.esRapido()
  
  method agregarCombustible(cantCombustible) {
    combustible = (combustible + cantCombustible).min(500)
  }
  
  method quitarCombustible(cantCombustible) {
    combustible = (combustible - cantCombustible).max(0)
  }
  
  method tieneElTanqueVacio() = self.cantDeCombustible() == 0
  
  method tieneTanqueLleno() = self.cantDeCombustible() == 500
}

