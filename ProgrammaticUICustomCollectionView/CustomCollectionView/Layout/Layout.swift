//
//  Layout.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit
protocol CatFeedDelegate {
    func heightForCell(at indexPath: IndexPath, in section: Int) -> CGFloat
}

class CatFeedLayout: UICollectionViewLayout {
    var cache = [UICollectionViewLayoutAttributes]()
    var delegate: CatFeedDelegate?
    
    let numberOfColumns = 1
    fileprivate let padding: CGFloat = 0
    fileprivate let headerHeight:  CGFloat = 30
    
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
        for section in 0..<collectionView.numberOfSections {
            let headerAttributes = createHeaderAttributes(for: section)
            cache.append(headerAttributes)
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                if item == 0 { currentColumn = 0 }
                let currentColumnFloat = CGFloat(currentColumn)
                let indexPath = IndexPath(item: item, section: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                
                // Calculate Attributes
                let xOrigin = columnWidth * (currentColumnFloat)
                guard let height = self.delegate?.heightForCell(at: indexPath, in: section) else { return }
                var yOrigin = CGFloat()
                if itemIsTop(item) {
                    yOrigin = endYForLatestSectionHead()
                }
                else if item < numberOfColumns && section == 0 {
                    yOrigin = padding + headerHeight
                }
                else if item >= numberOfColumns {
                    let totalCount = cache.count
                    let cellAbove = cache[totalCount - numberOfColumns]
                     yOrigin = cellAbove.frame.origin.y + cellAbove.frame.height + padding
                }
                attributes.frame = CGRect(x: xOrigin, y: yOrigin, width: columnWidth, height: height)
                cache.append(attributes)
                    print("section: \(section) and the row is \(indexPath.row) and frame is \(attributes.frame) and column: \(currentColumn)")
                
                if currentColumn < (numberOfColumns - 1) { currentColumn = currentColumn + 1}
                else { currentColumn = 0}
            }
        }
    }
    
    func createHeaderAttributes(for section: Int) ->  UICollectionViewLayoutAttributes {
        let headerAttributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, with: IndexPath(item: 0, section: section))
        if let collectionView = self.collectionView {
            let frame = CGRect(x: 0, y: endY(for: section), width: collectionView.frame.width, height: headerHeight)
            headerAttributes.frame = frame
        }
        return headerAttributes
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
    
    func endY(for section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return totalHeight
    }
    
    func endYForLatestSectionHead() -> CGFloat {
        let ee = cache.map { (attribute) -> CGFloat in
            if let kind = attribute.representedElementKind?.description {
                if kind == UICollectionElementKindSectionHeader {
                    return attribute.frame.origin.y + attribute.frame.height
                }
            }
            return 0
        }
        if let max = ee.max() { return max }
        else { return 0 }
    }

    
    func itemIsTop(_ item: Int) -> Bool {
        if item < numberOfColumns { return true }
        return false
    }
    
}

