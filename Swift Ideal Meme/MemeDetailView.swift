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
                    .foregroundColor(.yellow)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Descripción de mi situación")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(meme.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("Ubicación de la situación")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    Text(meme.address ?? "Sin ubicación")
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .foregroundColor(.white)
                    
                    Text("Imagen de la situación")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
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
        .background(Color.brown)
        .navigationTitle("Detalles del meme")
    }
}

#Preview {
    MemeDetailView(meme: MemeMatch(title: "Ejemplo", description: "Ejemplo de una descripción")
    )
}
