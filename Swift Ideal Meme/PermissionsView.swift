//
//  MainView.swift
//  Swift Ideal Meme
//
//  Created by CETYS Universidad  on 24/02/25.

import SwiftUI

struct PermissionsView: View {
    @StateObject private var permissionsViewModel = PermissionsViewModel()
    @Binding var profile: ProfileModel
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 30) {
                Text("Para continuar con la aplicación necesitas los permisos siguientes.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Text("Da click en cada botón para aceptar los permisos de la cámara, galería y ubicación")
                    .multilineTextAlignment(.center)
                VStack(spacing: 20) {
                    // CÁMARA
                    Button(action: {
                        permissionsViewModel.requestCameraAccess()
                    }) {
                        Text("Permitir acceso a cámara")
                    }
                    .disabled(permissionsViewModel.cameraGranted)
                    // BIBLIOTECA
                    Button(action: {
                        permissionsViewModel.requestPhotoLibraryAccess()
                    }) {
                        Text("Permitir acceso a biblioteca")
                    }
                    .disabled(permissionsViewModel.photoLibraryGranted)
                    // UBICACIÓN
                    Button(action: {
                        permissionsViewModel.requestLocationAccess()
                    }) {
                        Text("Permitir acceso a ubicación")
                    }
                    .disabled(permissionsViewModel.locationGranted)
                    NavigationLink(destination: ProfileView(profile: $profile)){
                        if ($profile.name.wrappedValue != "" || $profile.surname.wrappedValue != "" || $profile.age.wrappedValue != nil) {
                            Text("Modificar perfil").foregroundColor(.green)
                        }
                        else { Text("Crear perfil") }
                    }.disabled(!permissionsViewModel.cameraGranted || !permissionsViewModel.photoLibraryGranted)

                }
                Spacer()
                NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true))
                {
                   Text("Continuar")
               }
                .disabled($profile.name.wrappedValue == "" || $profile.surname.wrappedValue == "" || $profile.age.wrappedValue == nil || !permissionsViewModel.cameraGranted || !permissionsViewModel.photoLibraryGranted || !permissionsViewModel.locationGranted)
                    .tint(Color.blue)
            }
        }
    }
}
