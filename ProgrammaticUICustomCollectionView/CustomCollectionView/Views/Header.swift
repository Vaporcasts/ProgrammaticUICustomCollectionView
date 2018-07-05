//
//  Header.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class Header: UICollectionReusableView {
    var titleLabel = UILabel()
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

