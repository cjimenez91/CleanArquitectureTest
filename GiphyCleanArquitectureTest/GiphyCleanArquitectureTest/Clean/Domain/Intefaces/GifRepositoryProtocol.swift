//
//  GifRepositoryProtocol.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

protocol GifRepositoryProtocol {
    func searchGifs(query: String) async throws -> [GifItem]
}
