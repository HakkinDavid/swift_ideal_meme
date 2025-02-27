//
//  FormView.swift
//  Swift Ideal Meme
//
//  Created by David Santana on 19/02/2025.
//

import SwiftUI
import Contacts
import MapKit
struct FormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var description = ""
    @Binding var memes: [MemeMatch]
    
    // Nuevos estados
    @State private var userLatitude: Double?
    @State private var userLongitude: Double?
    @State private var userLocationAddress: String?
    @State private var image: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var locationManager = LocationManager()
    //@State private var voicenote: VoiceNote?
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("¿Qué meme te representa hoy?")) {
                    TextField("Nombre del meme", text: $title)
                    TextField("Descripción de la situación", text: $description)
                }
                VStack {
                    if let image = image {
                        Text("Imagen de la situación")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding()
                    } else {
                        Text("No seleccionó ninguna imagen")
                    }
                    Button(action: {
                        sourceType = .photoLibrary
                        showImagePicker = true
                    }) {
                        Label("Selecciona una imagen", systemImage: "photo")
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: $image, sourceType: sourceType)
                    }
                    
                }
                VStack {
                    if let latitude = userLatitude, let longitude = userLongitude {
                        Text("Ubicación de la situación")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Text(userLocationAddress ?? "Sin ubicación")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding()
                            .foregroundColor(.white)
                    }
                    else {
                        Button(action: {
                            locationManager.requestLocation()
                            userLatitude = locationManager.region.center.latitude
                            userLongitude = locationManager.region.center.longitude
                            locationManager.lookUpCurrentLocation(completionHandler: {
                                userLocationAddress = CNPostalAddressFormatter().string(from:$0?.postalAddress ?? CNPostalAddress())
                            } )
                        }) {
                            Label("Agregar ubicación de tu situación actual", systemImage: "location.fill")
                        }}
                }
                
            }
            .navigationTitle("Agregar MemeMatch")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancelar"){
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                // Recuerda guardar la ubicacion y la imagen cuando le pique save
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Guardar"){
                        let newMemeMatch = MemeMatch(title: title, description: description, image: image, latitude: userLatitude, longitude: userLongitude, address: userLocationAddress)
                        memes.append(newMemeMatch)
                        presentationMode.wrappedValue.dismiss()
                    }.disabled(title == "" || description == "" || image == nil)
                }
            }
        }
    }
}

