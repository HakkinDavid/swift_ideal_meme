//
//  Swift_Ideal_MemeApp.swift
//  Swift Ideal Meme
//
//  Created by David Santana  on 19/02/25.
//

import SwiftUI

@main
struct Swift_Ideal_MemeApp: App {
    @State private var profile = ProfileModel(name: "", surname: "", age: nil)
    
    var body: some Scene {
        WindowGroup {
            PermissionsView(profile: $profile)
        }
    }
}
