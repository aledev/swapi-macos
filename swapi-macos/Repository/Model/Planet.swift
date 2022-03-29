//
//  Planets.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

struct Planet  {
    
    let name: String
    let diameter: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let gravity: String
    let population: Date
    let climate: String
    let terrain: String
    let surfaceWater: String
    let residents: [String]
    let films: [String]
    let url: String
    let created: String
    let edited: String
    
}

extension Planet: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case diameter = "diameter"
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case gravity = "gravity"
        case population = "population"
        case climate = "climate"
        case terrain = "terrain"
        case surfaceWater = "surface_water"
        case residents = "residents"
        case films = "films"
        case url = "url"
        case created = "created"
        case edited = "edited"
    }
    
}
