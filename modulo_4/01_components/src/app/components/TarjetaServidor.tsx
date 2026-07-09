import { View, Text, StyleSheet } from 'react-native'

interface TarjetaServidorProps {
  nombre: string
  ip: string
  sistema: string
  puerto: number
}

export default function TarjetaServidor({ nombre, ip, sistema, puerto }: TarjetaServidorProps) {
  return (
    <View style={styles.tarjeta}>
      <Text style={styles.nombreServidor}>{nombre}</Text>
      <Text style={styles.datoDireccion}>{ip}:{puerto}</Text>
      <Text style={styles.datoSistema}>{sistema}</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  tarjeta: {
    padding: 12,
    borderRadius: 8,
    backgroundColor: '#fff',
    shadowColor: '#000',
    shadowOpacity: 0.05,
    shadowRadius: 6,
    elevation: 2,
    marginVertical: 8,
  },
  nombreServidor: {
    fontSize: 18,
    fontWeight: '600',
    marginBottom: 4,
  },
  datoDireccion: {
    fontSize: 14,
    color: '#333',
    marginBottom: 2,
  },
  datoSistema: {
    fontSize: 13,
    color: '#666',
  },
})