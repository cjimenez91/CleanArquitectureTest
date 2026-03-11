//
//  OldGifModel.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 11/3/26.
//

import Foundation

struct OldGifModel: Decodable {
    let data: [OldGifModelData]
}

struct OldGifModelData: Decodable, Identifiable {
    let id: String
    let images: OldGifModelDataImages
}

struct OldGifModelDataImages: Decodable {
    let original: OldGifModelDataImagesOriginal
}

struct OldGifModelDataImagesOriginal: Decodable {
    let url: String
}
