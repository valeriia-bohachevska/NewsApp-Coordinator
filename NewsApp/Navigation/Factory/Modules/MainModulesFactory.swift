//
//  MainModulesFactory.swift
//  NewsApp
//
//  Created by Valeriia Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriia Bohachevska. All rights reserved.
//

import Foundation

protocol MainModulesFactory {
    func makeNewsFeedView() -> NewsVC
    func makeNewsDetailView(news: NewsModel) -> NewsDetailVC
}
