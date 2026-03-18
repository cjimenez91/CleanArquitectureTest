//
//  GifListViewModel.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation
import Observation

@Observable
final class GiftListViewModel {
    var state: GifListViewState = .initial
    var query: String = ""

    private let searchGifsUseCase: SearchGifsUseCase

    init(searchGifsUseCase: SearchGifsUseCase) {
        self.searchGifsUseCase = searchGifsUseCase
    }

    func searchGifs() async {
        guard query.count > 3 else {
            state = .initial
            return
        }

        state = .loading

        let result = await searchGifsUseCase.execute(query: query)

        switch result {
        case .success(let gifs):
            if !gifs.isEmpty {
                self.state = .success(gifs)
            } else {
                self.state = .empty
            }

        case .failure(let error):
            self.state = .error(error.localizedDescription)
        }

    }

}
