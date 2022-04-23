//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class CharacterDetailViewModel: NSObject {
    
    //MARK: Properties
    var character: Character?
    
    //MARK: Custom Methods
    func createViewData() -> [Any] {
        guard let character = character else {
            return []
        }
        var data = [Any]()
        let characterImageCellModel = getDetailImagecell(imageURL: character.image)
        data.append(characterImageCellModel)
        let statusCellModel = getDetailInfoCell(infoTitle: "Status", info: character.status?.rawValue)
        data.append(statusCellModel)
        let speciesCellModel = getDetailInfoCell(infoTitle: "Species", info: character.species?.rawValue)
        data.append(speciesCellModel)
        let genderCellModel = getDetailInfoCell(infoTitle: "Gender", info: character.gender?.rawValue)
        data.append(genderCellModel)
        let currentLocationCellModel = getDetailInfoCell(infoTitle: "Current Location", info: character.location?.name)
        data.append(currentLocationCellModel)
        return data
    }
    
    private func getDetailImagecell(imageURL: String?) -> CharacterDetailImageCellModel {
        let characterImageCellModel = CharacterDetailImageCellModel(imageURL: imageURL)
        return characterImageCellModel
    }
    
    private func getDetailInfoCell(infoTitle: String?, info: String?) -> CharacterDetailInfoCellModel {
        let characterDetailCellModel = CharacterDetailInfoCellModel(title: infoTitle, value: info)
        return characterDetailCellModel
    }
}
