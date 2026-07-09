import { ReactNode } from 'react'
import { Text, View } from 'react-native'

interface CardProps {
    children: ReactNode       // cualquier JSX válido
    titulo: string
}

export default function Card({ titulo, children }: CardProps) {
    return (
        <View>
            <Text>{titulo}</Text>
            {children}
        </View>
    )
}