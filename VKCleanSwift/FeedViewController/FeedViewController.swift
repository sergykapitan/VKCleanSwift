//
//  FeedViewController.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkServise())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        fetcher.getFeed { (feedResponse) in
            guard let feedResponse = feedResponse else {return}
            feedResponse.items.map({ (feedItem) in
                print(feedItem.date)
            })
        }

    }
    
}
