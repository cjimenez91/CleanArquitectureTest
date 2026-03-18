//
//  GiphyCleanArquitectureTestTests.swift
//  GiphyCleanArquitectureTestTests
//
//  Created by Carlos Jimenez Quinto on 11/3/26.
//

import XCTest
@testable import GiphyCleanArquitectureTest

@MainActor
final class GiphyCleanArquitectureTestTests: XCTestCase {


    func test_onSearchQueryChangedInitialStateTrue() async {
        let sut = OldGifListViewModel()

        sut.query = "Cat"

        await sut.seachGifs()

        XCTAssertTrue(sut.isInitialState)
    }

    func test_onSearchQueryChangedOnGifSucces() async {
        let sut = OldGifListViewModel()

        sut.query = "Cats"

        await sut.seachGifs()

        XCTAssertFalse(sut.gifs.isEmpty)
    }

}
