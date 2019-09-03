//
//  FeedViewController.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private let  networkServise: Networking = NetworkServise()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        let params = ["filters": "post,photo"]
      //  networkServise.getFeed()
        networkServise.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
            }
            let decoder = JSONDecoder()
        //    decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let data = data else { return }
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print("json:\(json)")
            
            let response = try? decoder.decode(FeedResponseWrapped.self, from: data)
            print( response )
        }

        // Do any additional setup after loading the view.
    }
    

  

}
