//
//  GithubAPIError.swift
//  SwiftBeginDay14
//
//  Created by 一騎高橋 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

/// GithubAPI にアクセスした時にAPI側からエラーが返る時の構造体.
struct GithubAPIError: JSONDecodable, Error {
    
    /// GithubAPIにアクセスした時のリクエストが不正となる原因の詳細を保持する構造体.
    struct FieldError : JSONDecodable {
        let resource: String
        let field: String
        let code: String
        
        init(json: Any) throws {
            guard let dictionary = json as? [String: Any] else {
                throw JSONDecodeError.invalidFormat(json: json)
            }
            
            guard let resource = dictionary["resource"] as? String else {
                throw JSONDecodeError.missingValue(key: "resource", actualValue: dictionary["resource"])
            }
            guard let field = dictionary["field"] as? String else {
                throw JSONDecodeError.missingValue(key: "field", actualValue: dictionary["field"])
            }
            guard let code = dictionary["code"] as? String else {
                throw JSONDecodeError.missingValue(key: "code", actualValue: dictionary["code"])
            }
            
            self.resource = resource
            self.field = field
            self.code = code
        }
    }
    
    let message: String
    let fieldErrors: [FieldError]
    
    init(json: Any) throws {
        guard let dictionary = json as? [String: Any] else {
            throw JSONDecodeError.invalidFormat(json: json)
        }
        
        guard let message = dictionary["message"] as? String else {
            throw JSONDecodeError.missingValue(key: "message", actualValue: dictionary["message"])
        }
        let fieldErrorObjects = dictionary["errors"] as? [Any] ?? []
        let fieldErrors = try fieldErrorObjects.map {
            return try FieldError(json: $0)
        }
        
        self.message = message
        self.fieldErrors = fieldErrors
    }
}
