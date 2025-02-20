//
//  MemeDetailView.swift
//  Swift Ideal Meme
//
//  Created by David Santana  on 19/02/25.
//

import SwiftUI
import MapKit
struct MemeDetailView: View {
    var meme: MemeMatch
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(meme.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(LinearGradient(colors: [Color.blue, Color.purple], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(12)
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Descripción de mi trabajo")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text(meme.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    // Mostrar la ubicación utilizando un mapa:
                    if let latitude = meme.latitude, let longitude = meme.longitude {
                        Map(coordinateRegion: .constant(.init(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1)))
                        )
                        .frame(height: 200)
                    }
                    
                    if let image = meme.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding()
                    }
                    
                }
            }
            .padding()
        }
        .background(Color.gray.opacity(0.2))
        .navigationTitle("Meme Details")
    }
}

#Preview {
    MemeDetailView(meme: MemeMatch(title: "Ejemplo", description: "Ejemplo de una descripcion")
    )
}
