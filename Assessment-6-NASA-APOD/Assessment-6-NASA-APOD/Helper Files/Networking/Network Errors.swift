//
//  Network Errors.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    case unknownError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Check URL Endpoint."
        case .thrownError(let error):
            return "Thrown Error: \(error.localizedDescription)"
        case .noData:
            return "No Data Was Recieved From Network Fetch. Please Try Again Later."
        case .unableToDecode:
            return "Unable To Decode The Data From Network. Please Try Again Later."
        case .unknownError:
            return "An Unknown Error Has Occured. For Help, Please Call 867-5309 EXT: 69. Ask For Jenny."
        }
    }
}
