//
//  ErrorObject.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import UIKit

class ErrorResponse: Codable {
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case message = "error"
    }
}
