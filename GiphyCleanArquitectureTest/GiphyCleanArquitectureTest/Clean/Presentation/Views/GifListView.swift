//
//  GifListView.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import SwiftUI

struct GiftListView: View {

    @Bindable var viewModel: GiftListViewModel
    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]


    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Busca tus Gifs")
                .searchable(text: $viewModel.query, prompt: "Busca Gifs")
                .task(id: viewModel.query) {
                    await viewModel.searchGifs()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .initial:
            ContentUnavailableView("Empiza a buscar tus Gifs",
                                   systemImage: "magnifyingglass",
                                   description: Text("Escribre para encontrar tus Gifs Favoritos")
            )
        case .loading:
            ProgressView("Buscando Gifs..")
        case .success(let gifs):
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(gifs) { gif in
                        if let url = URL(string: gif.url) {
                            AsyncImage(url: url) { image in
                                image.resizable().scaledToFit()
                            } placeholder: {
                                ProgressView("Loading...")
                            }
                        }
                    }
                }
            }
        case .empty:
            ContentUnavailableView("Sin resultados",
                                   systemImage: "magnifyingglass",
                                   description: Text("No se han encontrado gifs")
            )
        case .error(let error):
            VStack {
                Text("Se ha producido un error")
                Text(error)
                    .bold()
            }
            .multilineTextAlignment(.center)
        }
    }
}




#Preview {
    let repository = GiphyRepositoryMock()
    let searchUseCase = SearchGifsUseCase(repository: repository)
    let viewModel = GiftListViewModel(searchGifsUseCase: searchUseCase)

    GiftListView(viewModel: viewModel)
}
