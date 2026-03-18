//
//  SearchGifsUseCase.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

final class SearchGifsUseCase {

    private let repository: GifRepositoryProtocol

    init(repository: GifRepositoryProtocol) {
        self.repository = repository
    }

    func execute(query: String) async -> Result<[GifItem], Error> {
        do {
            let gifsIems = try await repository.searchGifs(query: query)
            if gifsIems.isEmpty {
                return .success([])
            }

            return .success(gifsIems)
        } catch {
            return .failure(error)
        }
    }
}
