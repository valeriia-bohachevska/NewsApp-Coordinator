//
//  NewsService.swift
//  NewsApp
//
//  Created by Valeriaa Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriaa Bohachevska. All rights reserved.
//

import Foundation

protocol NewsService {
    func getNews(page: Int, completion: @escaping (Result<NewsResponse, Error>) -> ())
}
