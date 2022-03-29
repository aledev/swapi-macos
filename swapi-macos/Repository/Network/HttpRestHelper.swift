//
//  Networking.swift
//  swapi-macos
//
//  Created by Alejandro Ignacio Aliaga Martinez on 28/3/22.
//

import Foundation

enum NetworkError: Error {
    case wrongUrl
    case emptyResponse
    case wrongData
    case unhandledError
}

class HttpRestHelper {
    
    static let shared = HttpRestHelper()
    private let urlSession: URLSession = URLSession.shared
    
    private init(){
    }
    
    func httpGetRequest<T: Decodable>(endpoint: String, completionHandler: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: endpoint) else {
            DispatchQueue.main.async { completionHandler(.failure(.wrongUrl)) }
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: urlRequest) { (data, urlResponse, error) in
            guard let data = data else {
                DispatchQueue.main.async { completionHandler(.failure(.emptyResponse)) }
                return
            }
            
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                DispatchQueue.main.async { completionHandler(.failure(.wrongData)) }
                return
            }
            
            DispatchQueue.main.async { completionHandler(.success(decodedData)) }
        }
        task.resume()
    }
    
}
