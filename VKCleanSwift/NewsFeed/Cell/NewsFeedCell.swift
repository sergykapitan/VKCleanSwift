//
//  NewsFeedCell.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 03/09/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation
import UIKit

protocol FeedCellViewModel {
    var iconUrlString: String? { get }
    var name: String { get }
    var date: String { get }
    var text: String? { get }
    var like: String? { get }
    var comments: String? { get }
    var shares: String? { get }
    var views: String? { get }
    
    
    
}

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
    
    func set(viewModel: FeedCellViewModel) {
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likeLabel.text = viewModel.like
        commentLabel.text = viewModel.comments
        shareLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        
    }
}
