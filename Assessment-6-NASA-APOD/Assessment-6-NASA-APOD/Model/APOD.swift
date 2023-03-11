//
//  APOD.swift
//  Assessment-6-NASA-APOD
//
//  Created by Chase on 3/11/23.
//

import Foundation

struct APOD: Decodable {
    private enum CodingKeys: String, CodingKey {
        
        case date
        case explanation
        case title
        case APODUrl = "url"
        case copyright
    }
    
    let date: String
    let explanation: String
    let title: String
    let APODUrl: String
    let copyright: String?
}
