//
//  GetStationsService.swift
//  RadioMinimal
//
//  Created by Sergey Krasiuk on 22/01/2021.
//

import Foundation

enum MoviesService {
    case movies
}

extension MoviesService: EndPointProtocol {
    
    typealias Body = TMDBList
    
    var path: String {
        switch self {
        case .movies:
            return "/movie/popular"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movies:
            return .get
        }
    }
    
    var body: Body? {
        switch self {
            
        default:
            return nil
        }
    }
    
    var endpoint: String {
        return "?api_key=a2d29c12cb7b8d10f5c32abd53ce4f17"
    }
}
