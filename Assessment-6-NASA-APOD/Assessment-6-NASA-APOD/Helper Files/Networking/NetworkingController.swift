//
//  NetworkingController.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import UIKit

protocol NetworkingControllerServiceable {
    func fetchAPOD(with endpoint: APODEndPoint, completion: @escaping (Result <APOD, NetworkError>) -> Void)
    func fetchSearchedAPOD(with endpoint: APODEndPoint, fromDate date: String, completion: @escaping (Result <APOD, NetworkError>) -> Void)
    func fetchAPODImage(forAPOD image: String, completion: @escaping (Result <UIImage, NetworkError>) -> Void)
}

class NetworkingController {

    // MARK: - Properties
    let provider = APIService()

    // MARK: - Functions
    func fetchAPOD(with endpoint: APODEndPoint, completion: @escaping (Result <APOD, NetworkError>) -> Void) {

        guard let finalURL = endpoint.fullURL else { completion(.failure(.invalidURL)) ; return }

        let request = URLRequest(url: finalURL)
        provider.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let apod = try JSONDecoder().decode(APOD.self, from: data)
                    completion(.success(apod))
                } catch {
                    print("Error In Daily Do/Try/Catch: \(error.localizedDescription)")
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }

    func fetchSearchedAPOD(with endpoint: APODEndPoint, fromDate date: String, completion: @escaping (Result <APOD, NetworkError>) -> Void) {

        guard let finalURL = endpoint.fullURL else { completion(.failure(.invalidURL)) ; return }

        let request = URLRequest(url: finalURL)
        provider.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let searchedAPOD = try JSONDecoder().decode(APOD.self, from: data)
                    completion(.success(searchedAPOD))
                } catch {
                    print("Error In Searched Do/Try/Catch: \(error.localizedDescription)")
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
    
    func fetchAPODImage(forAPOD apod: APOD, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
        
        guard let imageURL = URL(string: apod.imageURL) else { completion(.failure(.invalidURL)) ; return }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            if let error = error {
                completion(.failure(.thrownError(error))) ; return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Image Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { completion(.failure(.noData)) ; return }
            guard let apodImage = UIImage(data: data) else { completion(.failure(.unableToDecode)) ; return }
            completion(.success(apodImage))
        } .resume()
    }
}
