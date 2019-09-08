//
//  NewsFeedModels.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 03/09/2019.
//  Copyright (c) 2019 Sergey Koriukin. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum NewsFeed {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getFeed
                case getNewsFeed
            }
        }
        struct Response {
            enum ResponseType {
                case presentNewsFeed(feed: FeedResponse)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayNewsFeed(feedViewModel: FeedViewModel)
            }
        }
    }
}
struct FeedViewModel {
    struct Cell: FeedCellViewModel {
        
        var iconUrlString: String?
        var name: String
        var date: String
        var text: String?
        var like: String?
        var comments: String?
        var shares: String?
        var views: String?
        var photoAttachment: FeedCellPhotoAtachmentViewModel?
    }
    struct FeedCellPhotoAttachment: FeedCellPhotoAtachmentViewModel {
       
        var photoUrlString: String?        
        var widht: Int
        var height: Int
    }
    let cells: [Cell]
}
