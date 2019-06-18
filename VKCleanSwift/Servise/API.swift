//
//  API.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.95"
    
    static let newsFeed = "/method/newsfeed.get"
    
}
//https://api.vk.com/method/newsfeed.get?user_ids=187514081&filters=post,photo&access_token=1d57c28c629dceb6c1b5766b7570370e922a951fab72f9639f18cc65780ca7a30407a836c505613b8bffa&v=5.95

// https://api.vk.com/method/users.get?
// user_ids=210700286&fields=bdate&access_token=533bacf01e11f55b536a565b57531ac114461ae8736d6506a3&v=5.95

//https://api.vk.com/method/users.get?user_ids=187514081&fields=bdate&access_token=1d57c28c629dceb6c1b5766b7570370e922a951fab72f9639f18cc65780ca7a30407a836c505613b8bffa&v=5.95
