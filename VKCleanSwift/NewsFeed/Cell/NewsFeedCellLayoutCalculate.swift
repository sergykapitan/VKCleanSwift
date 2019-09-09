//
//  NewsFeedCellLayoutCalculate.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 08/09/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation
import UIKit

struct Sizes: FeedCellSizes {
    var bottomView: CGRect
    var totalHeight: CGFloat

    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    
}
struct Constants {
    static let cardInsets = UIEdgeInsets(top: 0, left: 8, bottom: 12, right: 8)
    static let topViewHeight: CGFloat = 40
    static let postLabelInsets = UIEdgeInsets(top: 8 + Constants.topViewHeight + 8, left: 8, bottom: 8, right: 8)
    static let postLabelFont = UIFont.systemFont(ofSize: 15)
    static let bottomViewHieght: CGFloat = 58
}



protocol FeedCellLayoutCalculateProtocol {
     func sizes(postText: String?, photoAttachment: FeedCellPhotoAtachmentViewModel?) -> FeedCellSizes
}

final class NewsFeedCellLayoutCalculate: FeedCellLayoutCalculateProtocol {
 
    private let screenWidht: CGFloat
    
    init(screenWidht: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidht = screenWidht
    }

    func sizes(postText: String?, photoAttachment: FeedCellPhotoAtachmentViewModel?) -> FeedCellSizes {
        
        let cardViewWidth = screenWidht - Constants.cardInsets.left - Constants.cardInsets.right
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            let height = text.height(width: width, font: Constants.postLabelFont)
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        //MARK: - Work the postLabelFrame
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : postLabelFrame.maxY + Constants.postLabelInsets.bottom
        var attachmentFrame = CGRect(origin: CGPoint(x: 0,
                                                     y: attachmentTop),
                                     size: CGSize.zero)
        if let attachment = photoAttachment {
            let photoHieght: Float = Float(attachment.height)
            let photoWidth: Float = Float(attachment.widht)
  
            let ratio = CGFloat(photoHieght / photoWidth)
            attachmentFrame.size = CGSize(width: cardViewWidth, height: cardViewWidth * ratio)
        }
        //MARK: - Work the bottomViewFrame
        let bottomTop = max(postLabelFrame.maxY, attachmentFrame.maxY)
        let bottomViewFrame = CGRect(origin: CGPoint(x: 0, y: bottomTop),
                                     size: CGSize(width: cardViewWidth, height: Constants.bottomViewHieght))
        
        let totalHieght = bottomViewFrame.maxY + Constants.cardInsets.bottom
        
        
        
        
        return Sizes(bottomView: bottomViewFrame,
                     totalHeight: totalHieght,
                     postLabelFrame: postLabelFrame,
                     attachmentFrame: attachmentFrame)
    }
  
}
