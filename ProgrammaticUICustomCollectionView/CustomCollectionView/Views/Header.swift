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
    let margin: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 266, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
    
    func layout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: margin).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: margin).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

