//
//  NewsServiceImpl
//  NewsApp
//
//  Created by Valeriaa Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriaa Bohachevska. All rights reserved.
//

import Foundation

final class NewsServiceImpl: NewsService {
    func getNews(page: Int, completion: @escaping (Result<NewsResponse, Error>) -> ()) {
        HTTPClient.request(requestConvertible: NewsAPIRouter.getNews(page: page), completion: completion)
    }
}
