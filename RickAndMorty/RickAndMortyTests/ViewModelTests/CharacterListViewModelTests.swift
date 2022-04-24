//
//  CharacterListViewModelTest.swift
//  RickAndMortyTests
//
//  Created by Sharon Varghese on 24/04/2022.
//

import XCTest
@testable import RickAndMorty

class CharacterListViewModelTest: XCTestCase {
    var sut = CharacterListViewModel()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: Validations
    func testValidationForEmptyString()  {
        let isEmpty = sut.isSearchTextEmpty(text: "")
        XCTAssertTrue(isEmpty)
    }
    
    func testValidationForWhiteSpace()  {
        let isEmpty = sut.isSearchTextEmpty(text: "   ")
        XCTAssertTrue(isEmpty)
    }
    
    func testValidationForText()  {
        let isEmpty = sut.isSearchTextEmpty(text: "Rick")
        XCTAssertFalse(isEmpty)
    }
    
    func testShouldShowEmptyDataViewForEmptyData() {
        let shouldShowEmptyView = sut.shouldShowEmptyDataView(listItems: nil)
        XCTAssertTrue(shouldShowEmptyView)
    }
    
    func testShouldShowEmptyDataViewForData() {
        let model = CharacterListModel(id: 0, name: "Rick", episodes: "30 Episodes", imageURL: nil)
        let shouldShowEmptyView = sut.shouldShowEmptyDataView(listItems: [model])
        XCTAssertFalse(shouldShowEmptyView)
    }
    
    func testFilterBasedOnName() {
        let model1 = CharacterListModel(id: 0, name: "Morty Smith", episodes: "30 Episodes", imageURL: nil)
        let model2 = CharacterListModel(id: 0, name: "Summer Smith", episodes: "30 Episodes", imageURL: nil)
        sut.characterListModels = [model1, model2]
        let filteredArray = sut.filterCharactersBasedOnName(filterText: "Smith")
        XCTAssertEqual(filteredArray?.count, 2)
        let filteredArray1 = sut.filterCharactersBasedOnName(filterText: "Rick")
        XCTAssertEqual(filteredArray1?.count, 0)
        
    }
    
}
