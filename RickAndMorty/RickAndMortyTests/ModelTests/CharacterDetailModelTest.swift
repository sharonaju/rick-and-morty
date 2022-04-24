//
//  CharacterDetailModelTest.swift
//  RickAndMortyTests
//
//  Created by Sharon Varghese on 24/04/2022.
//

import XCTest
@testable import RickAndMorty
class CharacterDetailModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterDetailImageCellModel_canCreateInstance() {
        let instance = CharacterDetailImageCellModel(imageURL: "http://abc.com")
        XCTAssertNotNil(instance)
    }
    
    func testCharacterDetailImageCellModel_imageURLCanBecomeNil() {
        let instance = CharacterDetailImageCellModel(imageURL: nil)
        XCTAssertNotNil(instance)
    }
    
    func testCharacterDetailInfoCellModel_canCreateInstance() {
        let instance = CharacterDetailInfoCellModel(title: "Name", value: "Rick")
        XCTAssertNotNil(instance)
    }

}
