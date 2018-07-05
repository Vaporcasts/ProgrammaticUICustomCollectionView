//
//  ViewController.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var collectionView: CatFeedCollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
    }
    
}

extension ViewController {
    func setupCollectionView() {
        let layout = CatFeedLayout()
        collectionView = CatFeedCollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        layout.delegate = self
        if self.collectionView != nil { self.view.addSubview(collectionView!) }
    }
}

extension ViewController: CatFeedDelegate {
    func heightForCell(at indexpath: IndexPath) -> CGFloat {
        let cat = cats[indexpath.item]
        if let collectionView = self.collectionView, let layout = collectionView.collectionViewLayout as? CatFeedLayout {
            let imageWidth = collectionView.frame.width / CGFloat(layout.numberOfColumns)
            
            let catHeight = cat.imageSize.height
            let catWidth = cat.imageSize.width
            if catHeight > catWidth {
                let ratio = cat.imageSize.height / cat.imageSize.width
                let finalHeight = imageWidth * ratio
                print("the final height and width for indexPath \(indexpath.item) are \(finalHeight) and \(imageWidth)")
                return finalHeight
            } else if catWidth > catHeight {
                let ratio = cat.imageSize.height / cat.imageSize.width
                let finalHeight = imageWidth * ratio
                print("the final height and width for indexPath \(indexpath.item) are \(finalHeight) and \(imageWidth)")
                return finalHeight
            }
           
        }
        return 40
    }
}

extension ViewController: UICollectionViewDelegate {
    // Not going to implement this in this tutorial
    // but, you will need this if you want your cell to respond to touches in didSelectRowAtIndexpath
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as? CatCell {
            cell.setup(with: cats[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}


