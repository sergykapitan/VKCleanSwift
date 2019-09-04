//
//  WedImageView.swift
//  VKCleanSwift
//
//  Created by Sergey Koriukin on 04/09/2019.
//  Copyright © 2019 Sergey Koriukin. All rights reserved.
//

import UIKit

class WebImageView: UIImageView {
    
    func set(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self](data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    self?.image = UIImage(data: data)
                }
            }
        }
        dataTask.resume()
    }
}
