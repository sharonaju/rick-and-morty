//
//  ListViewModel.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterListViewModel: NSObject {
    
    //MARK: Properties
    var characters: [Character]?
    var characterListModels: [CharacterListModel]?
    private let numberOfCharactersToBeDisplayed = 20
    
    //MARK: Validations
    private func isSearchTextEmpty(text: String) -> Bool {
        return text.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func shouldShowEmptyDataView(listItems: [CharacterListModel]?) -> Bool {
        if let listItems = listItems, listItems.count > 0 {
            return false
        }
        return true
    }
    private func isNetworkConnected() -> Bool{
        return NetworkMonitor.shared.isConnected
    }
    
    func fetchCharacters(completion: @escaping (Result<[CharacterListModel], ErrorInfo>)->()) {
        if isNetworkConnected() == false {
            let error = ErrorInfo( body: "Please check your internet connection")
            completion(.failure(error))
        }
        API.shared.fetchCharacters { result in
            switch result {
            case .success(let data):
                if let characters = data.results{
                    self.characters = self.sliceArray(allCharacters: characters)
                    var characterList = [CharacterListModel]()
                    for character in characters {
                        let listModel = self.getCharacterListModelFromCharacters(character: character)
                        characterList.append(listModel)
                    }
                    self.characterListModels = characterList
                    completion(.success(characterList))
                } else {
                    let listEmptyError = ErrorInfo(body: "Empty List")
                    completion(.failure(listEmptyError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }

    private func sliceArray(allCharacters: [Character]) -> [Character] {
        let slicedArray = Array(allCharacters.prefix(numberOfCharactersToBeDisplayed))
        return slicedArray
    }
    
    private func getCharacterListModelFromCharacters(character: Character) -> CharacterListModel{
        let id = character.id
        let name = character.name
        var episodes = ""
        if let numberOfEpisodes = character.episode?.count, numberOfEpisodes > 0 {
            episodes =  numberOfEpisodes > 1 ? "\(numberOfEpisodes) Episodes" : "\(numberOfEpisodes) Episode"
        }
        let imageURL = character.image
        let characterListModel = CharacterListModel(id: id, name: name, episodes: episodes, imageURL: imageURL)
        return characterListModel
    }
    
    func getTheSelectedCharacterDetail(id: Int) -> Character? {
        let selectedCharacter = self.characters?.filter{ $0.id == id }.first
        return selectedCharacter
    }
    
    func filterCharactersBasedOnName(filterText: String?) -> [CharacterListModel]? {
        guard let filterText = filterText else {
            return self.characterListModels
        }
        if isSearchTextEmpty(text: filterText) {
            return self.characterListModels
        }
        let filteredArray = self.characterListModels?.filter {
            $0.name?.contains(filterText) == true
        }
        return filteredArray
    }    
}
