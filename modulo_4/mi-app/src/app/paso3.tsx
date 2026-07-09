import { Alert, Image, Pressable, StyleSheet, Text, View } from 'react-native'

export function Paso3() {
    return (
        <View style={styles.contenedor}>
            <Image
                source={{ uri: 'https://static.vecteezy.com/system/resources/thumbnails/032/176/191/small_2x/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg' }}
                style={styles.imagen}
            />
            <Text style={styles.titulo}>Michael</Text>
            <Pressable
                style={({ pressed }) => [
                    styles.boton,
                    pressed && styles.botonPresionado,
                ]}
                onPress={() => Alert.alert('Ver perfil', 'Mostrando información del perfil...')}
            >
                <Text style={styles.textoBoton}>Ver perfil</Text>
            </Pressable>
        </View>
    )
}

const styles = StyleSheet.create({
    contenedor: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#f5f5f5',
        gap: 16,
        padding: 24,
    },
    imagen: {
        width: 80,
        height: 80,
        borderRadius: 16,
    },
    titulo: {
        fontSize: 22,
        fontWeight: '700',
    },
    boton: {
        backgroundColor: '#1565c0',
        paddingVertical: 12,
        paddingHorizontal: 24,
        borderRadius: 8,
    },
    botonPresionado: {
        backgroundColor: '#0d47a1',
    },
    textoBoton: {
        color: '#fff',
        fontWeight: '600',
        fontSize: 16,
    },
})
