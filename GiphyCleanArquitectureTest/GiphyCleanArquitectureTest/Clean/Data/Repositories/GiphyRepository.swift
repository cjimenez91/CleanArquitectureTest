//
//  GiphyRepository.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

final class GiphyRepository: GifRepositoryProtocol {

    func searchGifs(query: String) async throws -> [GifItem] {

        let urlString = "https://api.giphy.com/v1/gifs/search?api_key=N6GGmT60ejgUEx4ianUdYGmknPG00uzP&q=\(query)&limit=20"

        guard let url = URL(string: urlString) else {
            throw NSError(domain: "UrlError", code: 0, userInfo: nil)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)


            /*
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Resultado:::\n\n \(jsonString)")
            } else {
                errorMessage = "Error al leer los datos"
            }*/

            let responseModel = try JSONDecoder().decode(GiphyResponseDTO.self, from: data)

            return GifItemMapper.map(responseModel)

        } catch(let error) {
            throw error
        }
    }
}
