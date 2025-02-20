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
                    .background(.black)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Descripción de mi situación")
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
        .background(Color.white)
        .navigationTitle("Detalles del meme")
    }
}

#Preview {
    MemeDetailView(meme: MemeMatch(title: "Ejemplo", description: "Ejemplo de una descripción")
    )
}
