//
//  WrapperData.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 29/3/22.
//

import Foundation

struct WrapperData<T: Codable>: Codable {
    
    let count: Int
    let next: String?
    let previous: String?
    let results: T?
    
}


