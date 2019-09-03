//
//  NetworkDataFetcher.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 03/09/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

protocol DataFetcher {
    func getFeed(responce: @escaping (FeedResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcher {
    
    let networking: Networking
    
    init (networking: Networking){
        self.networking = networking
    }
    
    func getFeed(responce: @escaping (FeedResponse?) -> Void) {
        let params = ["filters": "post, photo"]
        networking.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error recived requesting data: \(error.localizedDescription)")
                responce(nil)
            }
            let decoded = self.decodeJSON(type: FeedResponseWrapped.self, from: data)
            responce(decoded?.response)
        }
    }
    private func decodeJSON<T:Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let data = from, let responce = try? decoder.decode(type.self, from: data) else {return nil}
        return responce
        
    }
}
