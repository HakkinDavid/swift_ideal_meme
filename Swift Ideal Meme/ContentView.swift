//
//  ContentView.swift
//  Swift Ideal Meme
//
//  Created by David Santana on 19/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var memes: [MemeMatch] = []
    
    @State private var showAddMemeMatchView:Bool = false
    @State private var showProfileView:Bool = false
    @Binding var profile: ProfileModel
    
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
            .navigationTitle("Lista de MemeMatches")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showAddMemeMatchView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        showProfileView = true
                    }) {
                        Image(systemName: "person.circle.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddMemeMatchView) {
                FormView(memes: $memes)
            }
            .sheet(isPresented: $showProfileView) {
                ProfileView(profile: $profile)
            }
        }
    }
    
    func deleteMemeMatch(at offset: IndexSet) {
        memes.remove(atOffsets: offset)
    }
}
