import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Color de fondo personalizado usando RGB
            Color(red: 0, green: 168/255, blue: 107/255)
                .edgesIgnoringSafeArea(.all) // Asegura que el fondo cubra toda la pantalla
            
            VStack {
                HStack {
                    Text("NOMBRE DE LA APLICACION")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }.offset(x:0, y:30)
                
                RoundedRectangle(cornerRadius: 35)
                    .fill(Color(red: 159/255, green:213/255, blue: 209/255))
                    .frame(width: 550, height: 440)
                    .offset(x:0, y:145)
                Text("IMAGEN DE LA APLICACION")
                    .font(.system(size: 30))
                
                HStack{
                    Text("BIENVENIDO")
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                        .offset(x:0, y:240)
                        .bold()
                }
                
                HStack{
                    Button(action: {
                        // Acción del botón
                    }) {
                        Text("BOTON PARA INICAR LA APP")
                            .font(.system(size: 50))// Tamaño del texto
                            .bold()
                            .foregroundColor(.white) // Color del texto
                            .frame(width: 700, height: 100)
                            .background(Color(red: 159/255, green: 213/255, blue: 209/255)) // Fondo con color RGB
                            .cornerRadius(30) // Bordes redondeados
                    }
                }.offset(x:0, y:300)
            }.offset(x:0, y:-200)
        }
    }
    
}

#Preview {
    ContentView()
}
