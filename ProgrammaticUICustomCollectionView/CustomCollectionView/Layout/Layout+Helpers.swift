//
//  Layout+Helpers.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/7/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

extension CatFeedLayout {
    
    /// Tells us whether or not the item is in the top row of its section
    func itemIsTop(_ item: Int) -> Bool {
        return item < numberOfColumns
    }
    
    /// Gives us the bottom Y value for the latest section header
    func endYForLatestSectionHeader() -> CGFloat {
        let floats = cache.map { (attribute) -> CGFloat in
            if let kind = attribute.representedElementKind?.description {
                if kind == UICollectionElementKindSectionHeader {
                    return attribute.frame.origin.y + attribute.frame.height
                }
            }
            return 0
        }
        return floats.max() ?? 0
    }
    
    /// Calculates the Y origin for a given item
    func calculateYOrigin(for item: Int, inSection section: Int) -> CGFloat {
        if itemIsTop(item) { return endYForLatestSectionHeader() }
        else if item < numberOfColumns && section == 0 {
            return padding + headerHeight
        }
        else if item >= numberOfColumns {
            let cellAbove = cache[cache.count - numberOfColumns]
            return cellAbove.frame.origin.y + cellAbove.frame.height + padding
        }
        return 0
    }
    
}
