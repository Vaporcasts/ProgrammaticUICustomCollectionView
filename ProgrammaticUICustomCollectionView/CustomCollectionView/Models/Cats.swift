//
//  Cats.swift
//  ProgrammaticUICustomCollectionView
//
//  Created by Stephen Bodnar on 7/3/18.
//  Copyright © 2018 Stephen Bodnar. All rights reserved.
//

import Foundation
import CoreGraphics
// https://i.imgur.com/0jpDOpom.png 180 x 320

let catList = [CatList(breed: "Russian Blue", cats: [Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/BUJ0Tp6m.jpg", imageSize: CGSize(width: 320, height: 240)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239))]), CatList(breed: "Russian Blue", cats: [Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/NiHJrgNm.jpg", imageSize: CGSize(width: 320, height: 214)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319))]), CatList(breed: "Russian Blue", cats: [Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239)), Cat(imageUrl: "https://i.imgur.com/0jpDOpom.png", imageSize: CGSize(width: 180, height: 320)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239))])]

let cats = [Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/NiHJrgNm.jpg", imageSize: CGSize(width: 320, height: 214)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/vwzymK0m.jpg", imageSize: CGSize(width: 880, height: 1164)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/NiHJrgNm.jpg", imageSize: CGSize(width: 320, height: 214)), Cat(imageUrl: "https://i.imgur.com/6PC3SUym.jpg", imageSize: CGSize(width: 240, height: 319)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/vwzymK0m.jpg", imageSize: CGSize(width: 880, height: 1164)), Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239)), Cat(imageUrl: "https://i.imgur.com/7MbHhGLm.jpg", imageSize: CGSize(width: 321, height: 241)), Cat(imageUrl: "https://i.imgur.com/vwzymK0m.jpg", imageSize: CGSize(width: 880, height: 1164)),
    Cat(imageUrl: "https://i.imgur.com/2oTdDKFm.jpg", imageSize: CGSize(width: 320, height: 239))]
