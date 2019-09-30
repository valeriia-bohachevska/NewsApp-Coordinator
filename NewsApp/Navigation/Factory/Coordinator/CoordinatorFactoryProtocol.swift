//
//  CoordinatorFactoryProtocol.swift
//  NewsApp
//
//  Created by Valeriia Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriia Bohachevska. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeAppCoordinator(window: UIWindow) -> AppCoordinator
}
