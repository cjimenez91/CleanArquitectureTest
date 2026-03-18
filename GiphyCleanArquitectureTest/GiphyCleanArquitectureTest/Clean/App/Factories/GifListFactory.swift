//
//  GifListFactory.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//
import SwiftUI

struct GifListFactory {
    static func makeGifListView() -> some View {
        let repository = GiphyRepository()
        let searchUseCase = SearchGifsUseCase(repository: repository)
        let viewModel = GiftListViewModel(searchGifsUseCase: searchUseCase)

        return GiftListView(viewModel: viewModel)
    }

}
