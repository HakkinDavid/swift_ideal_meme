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
    @Binding var profile: ProfileModel
    
    var body: some View {
        Text("Perfil")
        Form{
            VStack {
                Section(header: Text("Foto de perfil")) {
                    if let image = $profile.picture.wrappedValue {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding()
                    } else {
                        Text("No seleccionó ninguna foto de perfil")
                    }
                    Button(action: {
                        sourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        Label("Selecciona una foto de perfil", systemImage: "photo")
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $profile.picture, sourceType: sourceType)
                    }}
                
            }
            Section(header: Text("Datos personales")) {
                TextField("Nombre", text: $profile.name)
                TextField("Apellido", text: $profile.surname)
                TextField("Edad", value: $profile.age, formatter: NumberFormatter())
                    .keyboardType(UIKeyboardType.decimalPad)
            }
        }
    }
        
        
}
