//
//  File.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

struct People {
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let starships: [String]
    let url: String
    let created: String
    let edited: String
    
}

extension People: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case height = "height"
        case mass = "mass"
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender = "gender"
        case homeworld = "homeworld"
        case films = "films"
        case species = "species"
        case starships = "starships"
        case url = "url"
        case created = "created"
        case edited = "edited"
    }
    
}
