//
//  NewsFeedCell.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 03/09/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation
import UIKit

class NewsFeedCell: UITableViewCell {
    
    static let reuseID = "NewsFeedCell"
    
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var postLabel: UILabel!
    
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var shareLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
