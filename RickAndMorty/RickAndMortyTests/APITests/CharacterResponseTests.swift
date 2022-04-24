//
//  CharacterResponseTests.swift
//  RickAndMortyTests
//
//  Created by Sharon Varghese on 24/04/2022.
//

import XCTest
@testable import RickAndMorty
class CharacterResponseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterResponse() throws {
        guard let path = Bundle(for: CharacterResponseTests.self).path(forResource: "MockCharacterResponse", ofType: "json")
        else { fatalError("Can't find search.json file") }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
        XCTAssertEqual(response.results?.count, 1)
        let character = response.results?.first
        XCTAssertEqual(character?.id, 1)
        XCTAssertEqual(character?.status, Status(rawValue: "Alive"))
        XCTAssertEqual(character?.gender, Gender(rawValue: "Male"))
        XCTAssertEqual(character?.episode?.count, 21)
    }

}
