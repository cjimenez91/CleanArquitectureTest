//
//  OldGifListView.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 11/3/26.
//

import SwiftUI

struct OldGifListView: View {

    @Bindable var viewModel: OldGifListViewModel = OldGifListViewModel()

    private let columns = [GridItem(.adaptive(minimum: 150), spacing: 10)]

    var body: some View {
        NavigationStack {
            Group {

                if viewModel.isInitialState {
                    ContentUnavailableView("Empiza a buscar tus Gifs",
                                           systemImage: "magnifyingglass",
                                           description: Text("Escribre para encontrar tus Gifs Favoritos")
                    )
                } else if viewModel.isLoading {
                    ProgressView("Buscando Gifs..")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text("Se ha producido un error")
                        Text(errorMessage)
                            .bold()
                    }
                    .multilineTextAlignment(.center)
                } else {
                    ScrollView {
                        /*
                         ForEach(0..<10) { _ in
                         ZStack {
                         Color.green
                         .frame(width: 100, height: 100)
                         .cornerRadius(10)
                         Text("Soy un Gif")
                         }
                         }*/
                        LazyVGrid(columns: columns, spacing: 10) {
                            /*
                            ForEach(0..<20) { _ in
                                ZStack {
                                    Color.green
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                    Text("Soy un Gif")
                                }
                            }*/
                            ForEach(viewModel.gifs) { gif in
                                if let url = URL(string: gif.images.original.url) {
                                    AsyncImage(url: url) { image in
                                        image.resizable().scaledToFit()
                                    } placeholder: {
                                        ProgressView("Loading...")
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Busca tus Gifs")
            .searchable(text: $viewModel.query, prompt: "Busca Gifs")
            .onChange(of: viewModel.query) {
                Task {
                    await viewModel.seachGifs()
                }
            }
        }
    }
}

#Preview {
    OldGifListView()
}
