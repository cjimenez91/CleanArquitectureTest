//
//  OldGifListViewModel.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 11/3/26.
//

import Foundation


@Observable
class OldGifListViewModel {
    var gifs: [OldGifModelData] = []
    var query: String = ""
    var isInitialState: Bool = true
    var isLoading: Bool = false
    var errorMessage: String? = nil


    func seachGifs() async {
        guard query.count > 3 else {
            isInitialState = true
            isLoading = false
            return
        }

        isInitialState = false
        isLoading = true


        // Aqui vamos a realizar la peticion de datos al servicio.


        let urlString = "https://api.giphy.com/v1/gifs/search?api_key=N6GGmT60ejgUEx4ianUdYGmknPG00uzP&q=\(query)&limit=20"

        guard let url = URL(string: urlString) else {
            errorMessage = "Error al formar la URL"
            isLoading = false
            isInitialState = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)


            /*
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Resultado:::\n\n \(jsonString)")
            } else {
                errorMessage = "Error al leer los datos"
            }*/

            let responseModel = try JSONDecoder().decode(OldGifModel.self, from: data)


            isInitialState = false
            isLoading = false
            errorMessage = nil

            gifs = responseModel.data


        } catch(let error) {
            isLoading = false
            errorMessage = error.localizedDescription
        }
    }
}

