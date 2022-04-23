//
//  ListViewModel.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterListViewModel: NSObject {

    func fetchCharacters(completion: @escaping (Result<[CharacterListModel], ErrorInfo>)->()) {
        API.shared.fetchCharacters { result in
            switch result {
            case .success(let data):
                if let characters = data.results{
                    var characterList = [CharacterListModel]()
                    for character in characters {
                        let listModel = self.getCharacterListModelFromCharacters(character: character)
                        characterList.append(listModel)
                    }
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
            episodes = "\(numberOfEpisodes) Episodes"
        }
        let imageURL = character.image
        let characterListModel = CharacterListModel(id: id, name: name, episodes: episodes, imageURL: imageURL)
        return characterListModel
    }
    
}
