//
//  Endpoints.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

let baseURL: String = "https://swapi.dev/api/"

enum Endpoints: String {
    case people = "people"
    case planets = "planets"
    case films = "films"
}
