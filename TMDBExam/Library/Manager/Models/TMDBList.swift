//
//  TMDBList.swift
//  TMDBExam
//
//  Created by Sergey Krasiuk on 06/12/2021.
//

import Foundation

struct TMDBList: Codable {
    
    var page: Int
    let results: [TMDBMovie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
