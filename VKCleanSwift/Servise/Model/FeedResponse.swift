//
//  FeedResponse.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 18/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

struct FeedResponseWrapped: Decodable {
    let response: FeedResponse
}

struct FeedResponse: Decodable {
    var items: [FeedItem]
}

struct FeedItem: Decodable {
    let type: String?
    let sourceId: Int
    let postId: Int
    let text: String?
    let date: Double
    let comments: CountableItem?
    let likes: CountableItem?
    let repost: CountableItem?
    let views: CountableItem?
}

struct CountableItem: Decodable {
    var count: Int
}
