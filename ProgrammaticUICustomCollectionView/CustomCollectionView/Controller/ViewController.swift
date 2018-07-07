//
//  ViewController.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupCollectionView()
    }
    
}

extension ViewController {
    func setupCollectionView() {
        // whether you are using a custom layout of not, if you want to create a UICOllectionview programatically, you must initialize it with a layout.
        let layout = CatFeedLayout()
        let yOrigin: CGFloat = 20
        let collectionView = CatFeedCollectionView(frame: CGRect(x: 0, y: yOrigin, width: self.view.frame.width, height: self.view.frame.height - yOrigin), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        layout.delegate = self
        self.view.addSubview(collectionView)
    }
}

extension ViewController: CatFeedDelegate {
    func heightForCell(at indexPath: IndexPath, in section: Int, forCollectionView collectionView: CatFeedCollectionView) -> CGFloat {
        let cat = catList[indexPath.section].cats[indexPath.item]
        if let layout = collectionView.collectionViewLayout as? CatFeedLayout {
            let imageWidth = collectionView.frame.width / CGFloat(layout.numberOfColumns)
            
            let catHeight = cat.imageSize.height
            let catWidth = cat.imageSize.width
            if catHeight > catWidth {
                let ratio = cat.imageSize.height / cat.imageSize.width
                let finalHeight = imageWidth * ratio
                return finalHeight
            } else if catWidth > catHeight {
                let ratio = cat.imageSize.height / cat.imageSize.width
                let finalHeight = imageWidth * ratio
                return finalHeight
            }
        }
        return 0
    }
}

extension ViewController: UICollectionViewDelegate {
    // Not going to implement this in this tutorial
    // but, you will need this if you want your cell to respond to touches in didSelectRowAtIndexpath
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            if let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? Header {
                header.configure(with: catList[indexPath.section].breed)
                return header
            }
        }
        return Header()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return catList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return catList[section].cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as? CatCell {
            let cat = catList[indexPath.section].cats[indexPath.item]
            cell.setup(with: cat)
            return cell
        }
        return UICollectionViewCell()
    }
}


