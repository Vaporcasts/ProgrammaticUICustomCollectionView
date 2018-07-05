//
//  Cat.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import Foundation
import CoreGraphics

class Cat {
    var imageUrl: String
    var imageSize: CGSize
    
    init(imageUrl: String, imageSize: CGSize) {
        self.imageUrl = imageUrl
        self.imageSize = imageSize
    }
    
    var url: URL? {
        return URL(string: imageUrl)
    }
}
