//
//  HTTPManager.swift
//  AdastraTestTask
//
//  Created by Aleksandr on 19.09.2022.
//

import Foundation

protocol HTTPManagerProtocol {
    typealias Result = (Swift.Result<Data, Error>) -> Void
    
    func get(url: URL, completionBlock: @escaping Result)
}

final class HTTPManager: HTTPManagerProtocol {
    private let urlSession = URLSession.shared
    
    func get(url: URL, completionBlock: @escaping HTTPManagerProtocol.Result) {
        let request = URLRequest(url: url)
        urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completionBlock(.success(data))
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completionBlock(.failure(error))
                }
            }
        }.resume()
    }
}
