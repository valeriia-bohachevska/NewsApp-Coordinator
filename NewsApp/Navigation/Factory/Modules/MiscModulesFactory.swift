//
//  MiscModulesFactory.swift
//  NewsApp
//
//  Created by Valeria Felindash on 31/05/2019.
//  Copyright © 2019 Valeria Felindash. All rights reserved.
//

import Foundation
import SafariServices

protocol MiscModulesFactory {
    func makeSafariView(url: URL) -> SFSafariViewController
}
