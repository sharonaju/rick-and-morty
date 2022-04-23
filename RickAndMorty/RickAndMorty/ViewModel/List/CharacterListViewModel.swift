//
//  ListViewModel.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterListViewModel: NSObject {

    var characters: [Character]?
    var characterListModels: [CharacterListModel]?
    
    func fetchCharacters(completion: @escaping (Result<[CharacterListModel], ErrorInfo>)->()) {
        API.shared.fetchCharacters { result in
            switch result {
            case .success(let data):
                if let characters = data.results{
                    self.characters = characters
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
    
    private func isSearchTextEmpty(text: String) -> Bool {
        return text.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
