//
//  Layout.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit
protocol CatFeedDelegate {
    func heightForCell(at indexpath: IndexPath) -> CGFloat
}

class CatFeedLayout: UICollectionViewLayout {
    var cache = [UICollectionViewLayoutAttributes]()
    var delegate: CatFeedDelegate?
    
    let numberOfColumns = 2
    fileprivate let padding: CGFloat = 15
    
    var totalHeight: CGFloat {
        let floats = cache.map { (attribute) -> CGFloat in
            return attribute.frame.origin.y + attribute.frame.height
        }
        if let max = floats.max() { return CGFloat(max) }
        return 0
    }
    
    var columnWidth: CGFloat {
        let numColumnsFloat = CGFloat(numberOfColumns)
        if let collView = collectionView { return collView.frame.width / numColumnsFloat }
        return 0
    }
    
    override var collectionViewContentSize: CGSize {
        if let collectionView = self.collectionView {
            return CGSize(width: collectionView.frame.width, height: totalHeight)
        } else { return CGSize(width: 0, height: 0) }
    }
    
    override func prepare() {
        guard let collectionView = self.collectionView else { return }
        var currentColumn = 0
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let currentColumnFloat = CGFloat(currentColumn)
            let indexPath = IndexPath(item: item, section: 0)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            // Calculate Attributes
            let xOrigin = columnWidth * (currentColumnFloat)
            guard let height = self.delegate?.heightForCell(at: indexPath) else { return }
            
            var yOrigin = CGFloat()
            if item < numberOfColumns { yOrigin = padding }
            else if item >= numberOfColumns {
                let cellAbove = cache[item - numberOfColumns]
                yOrigin = cellAbove.frame.origin.y + cellAbove.frame.height + padding
            }
            attributes.frame = CGRect(x: xOrigin, y: yOrigin, width: columnWidth, height: height)
            cache.append(attributes)
            
            if currentColumn < (numberOfColumns - 1) { currentColumn = currentColumn + 1}
            else { currentColumn = 0}
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
}

