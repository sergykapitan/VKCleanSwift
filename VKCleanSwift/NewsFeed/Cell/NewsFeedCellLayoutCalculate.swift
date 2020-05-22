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
    
    var moreTextButtonFrame: CGRect
    var bottomView: CGRect
    var totalHeight: CGFloat
    var postLabelFrame: CGRect
    var attachmentFrame: CGRect
    
}

protocol FeedCellLayoutCalculateProtocol {
     func sizes(postText: String?, photoAttachment: FeedCellPhotoAtachmentViewModel?,isFullSizePost: Bool ) -> FeedCellSizes
}

final class NewsFeedCellLayoutCalculate: FeedCellLayoutCalculateProtocol {
 
    private let screenWidht: CGFloat
    
    init(screenWidht: CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)) {
        self.screenWidht = screenWidht
    }

    func sizes(postText: String?, photoAttachment: FeedCellPhotoAtachmentViewModel? , isFullSizePost: Bool) -> FeedCellSizes {
        
        var showMoreTextButton:Bool = false
        let cardViewWidth = screenWidht - Constants.cardInsets.left - Constants.cardInsets.right
        
        //MARK - PostLabelFrame
        var postLabelFrame = CGRect(origin: CGPoint(x: Constants.postLabelInsets.left, y: Constants.postLabelInsets.top),
                                    size: CGSize.zero)
        if let text = postText, !text.isEmpty {
            let width = cardViewWidth - Constants.postLabelInsets.left - Constants.postLabelInsets.right
            var height = text.height(width: width, font: Constants.postLabelFont)
            
            let limitHeight = Constants.postLabelFont.lineHeight * Constants.minifieldPostLimitLines
            
            if !isFullSizePost && height > limitHeight {
                height = Constants.postLabelFont.lineHeight * Constants.minifieldPostLines
                showMoreTextButton = true
            }
            
            postLabelFrame.size = CGSize(width: width, height: height)
        }
        //MARK: - Work moreTextButtonFrame
        
        var moreTextButtonSize = CGSize.zero
            if showMoreTextButton {
                moreTextButtonSize = Constants.moreTextButtonSize
            }
        
        let moreTextButtonOrigin = CGPoint(x: Constants.moreTextButtonInsets.left, y: postLabelFrame.maxY)
        let moreTextButtonFrame = CGRect(origin: moreTextButtonOrigin, size: moreTextButtonSize)
        
        //MARK: - Work the postLabelFrame
        let attachmentTop = postLabelFrame.size == CGSize.zero ? Constants.postLabelInsets.top : moreTextButtonFrame.maxY + Constants.postLabelInsets.bottom
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
        
        
        
        
        return Sizes(moreTextButtonFrame: moreTextButtonFrame,
                     bottomView: bottomViewFrame,
                     totalHeight: totalHieght,
                     postLabelFrame: postLabelFrame,
                     attachmentFrame: attachmentFrame)
    }
  
}
