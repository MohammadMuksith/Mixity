//
//  Cities.swift
//  Mixity
//
//  Created by Mohammad Muksith on 3/27/23.
//

import SwiftUI

struct Events: Codable, Identifiable {
    let id: Int
    let type: String
    let title: String
    let datetime_local: String
    let performers: [Performer]
    let venue: Venue
    

    var imageUrl: URL? {
        guard let performer = performers.first else {
            return nil
        }
        return performer.image
    }
}

struct Performer: Codable, Identifiable {
    let id: Int
    let name: String
    let image: URL?
}

struct Venue: Codable, Identifiable {
    let id: Int
    let city: String
    let state: String?
    let country: String
    let name: String
    let address: String
    let extended_address: String
}

