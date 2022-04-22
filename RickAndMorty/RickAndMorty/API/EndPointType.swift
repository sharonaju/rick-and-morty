//
//  EndPointType.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import Foundation
import Alamofire

protocol EndPointType {
    
    var baseURL: String { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    
}
