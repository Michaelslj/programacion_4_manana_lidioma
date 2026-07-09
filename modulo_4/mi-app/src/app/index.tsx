// app/index.tsx
import { StyleSheet, Text, View } from 'react-native'
import { Paso2 } from './paso2'
import { Paso3 } from './paso3'

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Texto y vistas básicas                               │
// │  2  Paso 2  Imágenes y botones                                   │
// └──────────────────────────────────────────────────────────────────┘
const PASO = 3

export default function Index() {
  switch (PASO) {
    case 1:
      return <Paso1 />
    case 2:
      return <Paso2 />
    case 3:
      return <Paso3 />
    default:
      return (
        <View style={styles.contenedor}>
          <Text>Paso {PASO}: crea la pantalla primero</Text>
        </View>
      )
  }
}

function Paso1() {
  return (
    <>
      <View style={styles.contenedor}>
        <Text style={styles.titulo}>Hola desde React Native</Text>
        <Text style={styles.subtitulo}>Programacion IV</Text>
        <Text style={styles.detalle}>Michael Lidioma</Text>
      </View>
      <View style={styles.contenedor}>
        <Text style={styles.titulo}>Sistema de Monitoreo</Text>
        <Text style={styles.subtitulo}>Servidor web-01</Text>
        <Text style={styles.detalle}>10.0.2.10 · Ubuntu 24.04</Text>
      </View>
      <View style={styles.contenedor}>
        <Text style={styles.titulo}>Sistema de Monitoreo</Text>
        <Text style={styles.subtitulo}>Servidor web-01</Text>
        <Text style={styles.detalle}>10.0.2.10 · Ubuntu 24.04</Text>
      </View>
    </>
  )
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#f5f5f5',
    gap: 16,
  },
  titulo: { fontSize: 20, fontWeight: '600' },
  subtitulo: { fontSize: 16, color: '#333' },
  detalle: { fontSize: 13, color: '#777' },
  boton: {
    backgroundColor: '#1565c0',
    paddingVertical: 12,
    paddingHorizontal: 24,
    borderRadius: 8,
  },
  botonPresionado: { backgroundColor: '#0d47a1' },
  textoBoton: { color: '#fff', fontWeight: '600', fontSize: 16 },
})