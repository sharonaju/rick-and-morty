//
//  ErrorInfo.swift
//  RickAndMorty
//
//  Created by Sharon Varghese on 22/04/2022.
//

import Foundation
import Alamofire

struct ErrorInfo: Error {
    let code: Int?
    let responseCode: String?
    var title: String?
    var body: String?
    
    init(code: Int? = nil, responseCode: String? = nil, title: String? = nil, body: String? = nil) {
        self.code = code
        self.responseCode = responseCode
        self.title = title
        self.body = body
    }
    static func getErrorInfo(alamofireError: AFError?) -> ErrorInfo
    {
        var errorInfo: ErrorInfo = ErrorInfo(body: "Something went wrong")
        if let alamofireError = alamofireError {
            errorInfo = ErrorInfo(body: alamofireError.errorDescription)
        }
        return errorInfo
    }
}
