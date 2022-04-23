//
//  EndPointItem.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import Foundation
import Alamofire

enum EndPointItem {
    
    case characters
}

extension EndPointItem: EndPointType{
    var headers: HTTPHeaders? {
        return ["Content-Type": "application/json",
                "X-Requested-With": "XMLHttpRequest"]
    }
    
    var baseURL: String {
        return "https://rickandmortyapi.com/api/"
    }
    
    var path: String {
        return "character"
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .characters:
            return .get
        }
    }
    
    var url: URL {
        return URL(string: self.baseURL + self.path)!
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
