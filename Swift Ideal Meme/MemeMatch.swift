//
//  MemeMatch.swift
//  Swift Ideal Meme
//
//  Created by David Santana  on 19/02/25.
//

import SwiftUI
import CoreLocation

struct MemeMatch: Identifiable {
    let id = UUID()
    var title: String
    var description: String
    var image: UIImage?
    var latitude: Double?
    var longitude: Double?
}
