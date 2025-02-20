//
//  ContentView.swift
//  Swift Ideal Meme
//
//  Created by David Santana on 19/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var memes: [MemeMatch] = [
    MemeMatch(title: "Prueba",
         description: "No seas tan crédulo, McFly"),
    MemeMatch(title: "Otra prueba",
         description: "Otro gato")
    ]
    
    @State private var showAddMemeMatchView:Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(memes) { meme in
                    NavigationLink(destination: MemeDetailView(meme: meme)) {
                        Text(meme.title)
                    }
                }
                .onDelete(perform: deleteMemeMatch)
            }
            .navigationTitle("Lista de Tareas")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showAddMemeMatchView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddMemeMatchView) {
                FormView(memes: $memes)
            }
        }
    }
    
    func deleteMemeMatch(at offset: IndexSet) {
        memes.remove(atOffsets: offset)
    }
}

#Preview {
    ContentView()
}
