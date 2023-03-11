//
//  EndPoint.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import Foundation

enum APODEndPoint {

    static let baseURL = URL(string: "https://api.nasa.gov/planetary/apod")
    static let apiQuery = URLQueryItem(name: "api_key", value: "6FWUge4KKZMAWtAY8KrBypHzHiPnQMitR3EhbTRX")
    
    case today
    case search(String)
    
    var fullURL: URL? {
        guard let url = Self.baseURL,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil }
        switch self {
        case .today:
            urlComponents.queryItems = [Self.apiQuery]
            
        case .search(let date):
            let searchStartQuery = URLQueryItem(name: "start_date", value: date)
            let searchEndQuery = URLQueryItem(name: "end_date", value: date)
            urlComponents.queryItems = [Self.apiQuery, searchStartQuery, searchEndQuery]
            
        }
        return urlComponents.url
    }
}
