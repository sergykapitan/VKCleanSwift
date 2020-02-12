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
    var photoAttachment: FeedCellPhotoAtachmentViewModel? { get }
    var sizes: FeedCellSizes { get }
}
protocol FeedCellSizes {
    var postLabelFrame: CGRect { get }
    var attachmentFrame: CGRect { get }
    var bottomView: CGRect { get }
    var totalHeight: CGFloat { get }
}
protocol FeedCellPhotoAtachmentViewModel {
    var photoUrlString: String? { get }
    var widht: Int { get }
    var height: Int { get }
}


class NewsFeedCell: UITableViewCell {
    
    static let reuseID = "NewsFeedCell"
    
    // MARK: - Outlets
    
    @IBOutlet var cardView: UIView!
    
    @IBOutlet var iconImageView: WebImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var postLabel: UILabel!
    @IBOutlet var postimageview: WebImageView!
    
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var shareLabel: UILabel!
    @IBOutlet var viewsLabel: UILabel!
    
    @IBOutlet var bottomView: UIView!
    
    
    override func prepareForReuse() {
        iconImageView.set(imageUrl: nil)
        postimageview.set(imageUrl: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = 5
        iconImageView.clipsToBounds = true
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        backgroundColor = .clear
        selectionStyle = .none
        
        
    }
    
    func set(viewModel: FeedCellViewModel) {
        iconImageView.set(imageUrl: viewModel.iconUrlString!)
        nameLabel.text = viewModel.name
        dateLabel.text = viewModel.date
        postLabel.text = viewModel.text
        likeLabel.text = viewModel.like
        commentLabel.text = viewModel.comments
        shareLabel.text = viewModel.shares
        viewsLabel.text = viewModel.views
        //serw
        
        postLabel.frame = viewModel.sizes.postLabelFrame
        postimageview.frame = viewModel.sizes.attachmentFrame
        
        bottomView.frame = viewModel.sizes.bottomView
        
        
        
        if let photoAttachment = viewModel.photoAttachment {
            postimageview.set(imageUrl: photoAttachment.photoUrlString)
            postimageview.isHidden = false
        } else {
            postimageview.isHidden = true
        }
        
    }
}
