//
//  Film.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

struct Film {
    
    let title: String
    let episodeId: Int
    let openingCrawl: String
    let director: String
    let producer: String
    let releaseDate: Date
    let species: [String]
    let starships: [String]
    let vehicles: [String]
    let characters: [String]
    let planets: [String]
    let url: String
    let created: String
    let edited: String
    
}

extension Film: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case releaseDate = "release_date"
        case species = "species"
        case starships = "starships"
        case vehicles = "vehicles"
        case characters = "characters"
        case planets = "planets"
        case url = "url"
        case created = "created"
        case edited = "edited"
    }
    
}
