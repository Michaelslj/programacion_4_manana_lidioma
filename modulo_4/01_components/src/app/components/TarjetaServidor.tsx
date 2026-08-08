// En React web usarías <div> y <span>.
// En React Native usas <View> y <Text> — el resultado es nativo real.

import { Text, View } from "react-native"

interface TarjetaServidorProps {
  nombre: string
  ip: string
  sistema: string
  puerto: number
}

export function TarjetaServidor({ nombre, ip, sistema, puerto }: TarjetaServidorProps) {
  return (
    <View>
      <Text>{nombre}</Text>
      <Text>{ip} · {sistema}</Text>
      <Text>{puerto}</Text>
    </View>
  )
}