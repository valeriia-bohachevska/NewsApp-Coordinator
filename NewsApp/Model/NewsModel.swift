//
//  NewsModel.swift
//  NewsApp
//
//  Created by Valeriaa Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriaa Bohachevska. All rights reserved.
//

import Foundation

class NewsModel: Codable {
    let title: String?
    let desc: String?
    let publishedAt: Date?
    private let imageLink: String?
    private let contentLink: String?

    var imageUrl: URL? {
        if let imageLink = imageLink {
            return URL(string: imageLink)
        }
        
        return nil
    }
    
    var contentUrl: URL? {
        if let contentLink = contentLink {
            return URL(string: contentLink)
        }
        
        return nil
    }
    
    private enum CodingKeys: String, CodingKey {
        case desc = "description"
        case imageLink = "urlToImage"
        case contentLink = "url"
        case publishedAt
        case title
    }
}

struct NewsResponse: Codable {
    let articles: [NewsModel]
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case articles
        case totalResults
    }
}
