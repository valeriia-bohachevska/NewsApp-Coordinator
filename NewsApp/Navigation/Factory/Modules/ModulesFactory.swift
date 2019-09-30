//
//  ModulesFactory.swift
//  NewsApp
//
//  Created by Valeriia Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriia Bohachevska. All rights reserved.
//

import Foundation
import SafariServices

final class ModulesFactory { }

// MARK: - MainModulesFactory
extension ModulesFactory: MainModulesFactory {
    func makeNewsFeedView() -> NewsVC {
        let vc = NewsVC.loadFromStoryboard()
        vc.newsService = NewsServiceImpl()
        return vc
    }
    
    func makeNewsDetailView(news: NewsModel) -> NewsDetailVC {
        let vc = NewsDetailVC.loadFromStoryboard()
        vc.newsModel = news
        return vc
    }
}

// MARK: - MiscModulesFactory
extension ModulesFactory: MiscModulesFactory {
    func makeSafariView(url: URL) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
}
