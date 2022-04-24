//
//  CharacterListModelTest.swift
//  RickAndMortyTests
//
//  Created by Sharon Varghese on 24/04/2022.
//

import XCTest
@testable import RickAndMorty

class CharacterListModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterListModel_canCreateInstance() {
        let instance = CharacterListModel(id: 0, name: "Rick", episodes: "20 Episodes", imageURL: "http://abc.dkjs")
        XCTAssertNotNil(instance)
    }
    
    func testCharacterListModel_imageURLCanBecomeNil() {
        let instance = CharacterListModel(id: 0, name: "Rick", episodes: "20 Episodes", imageURL: nil)
        XCTAssertNotNil(instance)
    }
    
    func testCharacterListModel_episodesCanBecomeNil() {
        let instance = CharacterListModel(id: 0, name: "Rick", episodes: nil, imageURL: nil)
        XCTAssertNotNil(instance)
    }

}
