//
//  API.swift
//  Mixity
//
//  Created by Mohammad Muksith on 3/27/23.
//


import SwiftUI


func EventsModel(completion: @escaping ([Events]) -> Void) {
    let url = URL(string: "https://api.seatgeek.com/2/events?client_id=MzI2NzIxMTZ8MTY4MDAyMTAxNy44NzY3MTU0&client_secret=a6fa14d9a742e44c545c260eb6750ca0802d0c2fc5892c45aa7b36cf3cbc3338&q=detroit&per_page=200&taxonomies.name=concert")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            do {
                let decoder = JSONDecoder()
                let events = try decoder.decode(EventsResponse.self, from: data)
                completion(events.events)
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
    }
    task.resume()
}



struct EventsResponse: Codable {
    let events: [Events]
}

