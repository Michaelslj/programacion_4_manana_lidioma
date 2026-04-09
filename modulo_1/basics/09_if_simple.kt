fun main() {
  println("Controles de flujo")
  println("Condicion if ")
  println("Incluir temperatura ")
  val temperatura = readLine()?.toDoubleOrNull()?: 36.5
  if (temperatura>=38.0){
      println("Fiebre detectada: derivar consulta prioritaria")
  }
  if (temperatura>=40.0){
      println("Fiebre alta: derivar consulta prioritaria")
  }
  println("Temperatura registrada: $temperatura grados centigrados")

  }