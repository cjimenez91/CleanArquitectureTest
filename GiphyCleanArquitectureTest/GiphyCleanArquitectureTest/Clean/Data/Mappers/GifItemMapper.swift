//
//  GifItemMapper.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

struct GifItemMapper {
    static func map(_ dto: GiphyResponseDTO) -> [GifItem] {
        return dto.data.compactMap { gifDTO in
            return GifItem(id: gifDTO.id,
                           url: gifDTO.images.original.url)
         }
    }
}
