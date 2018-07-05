//
//  CatCell.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class CatCell: UICollectionViewCell {
    var imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.clipsToBounds = true
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutCell(with: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
    
    func setup(with cat: Cat) {
        imageView.setImageViewWithUrl(cat.imageUrl)
    }
}

extension CatCell {
    func layoutCell(with frame: CGRect) {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.contentMode = .scaleAspectFit
    }
}
