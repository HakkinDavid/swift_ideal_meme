//
//  Profile.swift
//  Swift Ideal Meme
//
//  Created by CETYS Universidad  on 24/02/25.
//

import SwiftUI
import CoreLocation

struct Profile: Identifiable {
    var id: ObjectIdentifier
    var name: String
    var description: String
    var image: UIImage?
    var age: Int?
   
}
