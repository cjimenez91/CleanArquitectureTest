//
//  GiphyResponseDTO.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

struct GiphyResponseDTO: Decodable {
    let data: [GiphyResponseDTOData]
}

struct GiphyResponseDTOData: Decodable, Identifiable {
    let id: String
    let images: GiphyResponseDTODataImages
}

struct GiphyResponseDTODataImages: Decodable {
    let original: GiphyResponseDTODataImagesOriginal
}

struct GiphyResponseDTODataImagesOriginal: Decodable {
    let url: String
}
