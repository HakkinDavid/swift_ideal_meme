//
//  MemeMatch 2.swift
//  Swift Ideal Meme
//
//  Created by CETYS Universidad  on 24/02/25.
//


//
//  MemeMatch.swift
//  Swift Ideal Meme
//
//  Created by David Santana  on 19/02/25.
//

import SwiftUI
import CoreLocation

struct ProfileModel: Identifiable {
    let id = UUID()
    var name: String
    var surname: String
    var picture: UIImage?
    var age: Int?
}
