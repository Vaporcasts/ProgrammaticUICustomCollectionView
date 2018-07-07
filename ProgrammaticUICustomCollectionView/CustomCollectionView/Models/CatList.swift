//
//  CatList.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/5/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import Foundation

class CatList {
    var breed: String
    var cats: [Cat]
    
    init(breed: String, cats: [Cat]) {
        self.breed = breed
        self.cats = cats
    }
}
