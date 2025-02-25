//
//  ProfileView.swift
//  Swift Ideal Meme
//
//  Created by CETYS Universidad  on 24/02/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var profile=Profile.self
    
    var body: some View {
        Text("ProfileView")
        ScrollView {
            OnInsertTableRowModifier()
            VStack(alignment: .leading, spacing: 20) {
                Text(profile.name)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.blue)
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Descripción de mi situación")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    Text(profile.description)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: profile.image, sourceType: sourceType)
                        }
                    if let image = profile.image {
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

#Preview{
    ProfileView(profile: Profile(id: , id: <#ObjectIdentifier#>, name: "Adam", description: "Dia perfecto",image: <#T##UIImage?#>,age: 25))
}
