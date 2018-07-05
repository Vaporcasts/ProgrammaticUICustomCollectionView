//
//  Extensions.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImageViewWithUrl(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: url, completionHandler: { (imageData, response, error) in
                DispatchQueue.main.async {
                    if let unwrappedData = imageData, let image = UIImage(data: unwrappedData) {
                        self.image = image
                    }
                }
            })
            task.resume()
        }
    }
}
