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
        // when the item is the top in its section, its yOrigin will just be
        // the same as the enYdY for the sectionHeader above it
        if itemIsTop(item) { return endYForLatestSectionHeader() }
        
        // if the item is in the top row of section 0
        else if item < numberOfColumns && section == 0 {
            return padding + headerHeight
        }
            
        // for all other cases where the item is not in the top row
        else if item >= numberOfColumns {
            let cellAbove = cache[cache.count - numberOfColumns]
            return cellAbove.frame.origin.y + cellAbove.frame.height + padding
        }
        
        // fallback return
        return 0
    }
    
}
