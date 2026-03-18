//
//  GiphyRepositoryMock.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

final class GiphyRepositoryMock: GifRepositoryProtocol {
    func searchGifs(query: String) async throws -> [GifItem] {
        return [GifItem(id: "1", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif"),
                        GifItem(id: "2", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif"),
                        GifItem(id: "3", url:  "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif"),
                        GifItem(id: "4", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")
                ,
                GifItem(id: "5", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")
                ,
                GifItem(id: "6", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")
                ,
                GifItem(id: "7", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")
                ,
                GifItem(id: "7", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")
                ,
                GifItem(id: "8", url: "https://media3.giphy.com/media/v1.Y2lkPWI2MjM0NTNmZTR0cDM0ZGJodHd4dDdsZXJjNW80dnNtNGdrYmw2eDR5aGVyd3VlYiZlcD12MV9naWZzX3NlYXJjaCZjdD1n/jUwpNzg9IcyrK/giphy.gif")]
    }
}
