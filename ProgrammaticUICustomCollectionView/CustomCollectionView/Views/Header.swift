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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 266, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func layout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 10)
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10)
    }
}

