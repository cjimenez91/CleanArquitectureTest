//
//  GifListViewState.swift
//  GiphyCleanArquitectureTest
//
//  Created by Carlos Jimenez Quinto on 18/3/26.
//

import Foundation

enum GifListViewState {
    case initial
    case loading
    case success([GifItem])
    case empty
    case error(String)
}
