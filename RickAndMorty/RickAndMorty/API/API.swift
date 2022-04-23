//
//  API.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 23/04/2022.
//

import UIKit

class API: NSObject {
    static let shared = API()
    //This prevents others from using the default '()' initializer for this class.
    private override init() {
        
    }
    func fetchCharacters(completion: @escaping (Result<CharacterResponse, ErrorInfo>)->()) {
        APIManager.shared().call(type: EndPointItem.characters) { (result: Swift.Result<CharacterResponse, ErrorInfo>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
