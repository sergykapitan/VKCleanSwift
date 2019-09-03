//
//  NetworkServise.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 17/06/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String], complation:  @escaping (Data?,Error?) -> Void)
}


final class NetworkServise: Networking {
    
    private let authServise: AuthServise
    
    init(authServise: AuthServise = AppDelegate.shared().authServise) {
        self.authServise = authServise
    }
    
    func request(path: String, params: [String : String], complation: @escaping (Data?, Error?) -> Void) {
        guard let token = authServise.token else {return}
        var allParams = params
        allParams["access_token"] = token
        allParams["v"] = API.version
        let url = self.url(from: path, params: allParams)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, complation: complation)
        task.resume()
        print(url)
        
    }
    private func createDataTask(from request: URLRequest, complation: @escaping (Data?,Error?) -> Void ) -> URLSessionDataTask
    {
        return URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                complation(data, error)
            }
        })
    }
    
    private func url(from path: String, params: [String: String]) -> URL {
        
        var components = URLComponents()
        
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.newsFeed
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
    
}
