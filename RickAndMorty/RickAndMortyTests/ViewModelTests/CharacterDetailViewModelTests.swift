//
//  CharacterDetailViewModelTests.swift
//  RickAndMortyTests
//
//  Created by Sharon Varghese on 24/04/2022.
//

import XCTest
@testable import RickAndMorty

class CharacterDetailViewModelTests: XCTestCase {

    var sut = CharacterDetailViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDataContainsViewData() {
        let character = Character(id: 10,
                                  name: "Rick",
                                  episode: ["ewhf", "djhf"],
                                  image: "http://abc.com",
                                  status: Status(rawValue: "Alive"),
                                  species: Species(rawValue: "Human"),
                                  gender: Gender(rawValue: "Male"),
                                  origin: nil,
                                  location: Location(name: "Citadel of Ricks", url: "http://abc.com"),
                                  type: "bdhj",
                                  url: nil,
                                  created: nil)
        sut.character = character
        let viewData = sut.createViewData()
        XCTAssertEqual(viewData.count, 5)
    }

}
