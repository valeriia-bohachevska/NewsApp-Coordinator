//
//  NewsCell.swift
//  NewsApp
//
//  Created by Valeriaa Bohachevska on 30/05/2019.
//  Copyright © 2019 Valeriaa Bohachevska. All rights reserved.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleNews: UILabel!
    @IBOutlet weak var dataNews: UILabel!
    static public let newsCellID = "NewsCellID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
    }
    
}
