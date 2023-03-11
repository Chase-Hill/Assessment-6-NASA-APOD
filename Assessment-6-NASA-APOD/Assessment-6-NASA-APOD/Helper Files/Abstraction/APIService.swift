//
//  APIService.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import Foundation

struct APIService {
    
    func perform(_ request: URLRequest, APODLoaded: @escaping (Result <Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                APODLoaded(.failure(.thrownError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            guard let data = data else {
                APODLoaded(.failure(.noData))
                return
            }
            APODLoaded(.success(data))
        } .resume()
    }
}
