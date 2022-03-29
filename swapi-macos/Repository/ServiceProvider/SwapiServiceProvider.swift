//
//  SwapiServiceProvider.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

typealias RequestHandler<T: Codable> = (Result<WrapperData<T>, NetworkError>) -> Void

protocol SwapiServiceProviderProtocol: NSObjectProtocol {
        
    func getPeopleList(completionHandler: @escaping RequestHandler<[People]>)
    func getFilmList(completionHandler: @escaping RequestHandler<[Film]>)
    func getPlanetList(completionHandler: @escaping RequestHandler<[Planet]>)
    
}

class SwapiServiceProvider: NSObject, SwapiServiceProviderProtocol {
    let httpRestHelper = HttpRestHelper.shared
    
    override init() {
    }
    
    func getPeopleList(completionHandler: @escaping RequestHandler<[People]>) {
        httpRequest(endpoint: .people, completionHandler: completionHandler)
    }
    
    func getFilmList(completionHandler: @escaping RequestHandler<[Film]>) {
        httpRequest(endpoint: .films, completionHandler: completionHandler)
    }
    
    func getPlanetList(completionHandler: @escaping RequestHandler<[Planet]>) {
        httpRequest(endpoint: .planets, completionHandler: completionHandler)
    }
    
    fileprivate func httpRequest<T>(endpoint: Endpoints, completionHandler: @escaping RequestHandler<T>) {
        let requestUrl = baseURL + endpoint.rawValue
        httpRestHelper.httpGetRequest(endpoint: requestUrl, completionHandler: completionHandler)
    }
                                                                              
}
