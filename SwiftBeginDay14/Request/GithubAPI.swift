//
//  GithubAPI.swift
//  SwiftBeginDay14
//
//  Created by 一騎高橋 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

final class GithubAPI {
    
    /// Repositoryを検索する想定のAPIアクセスの構造体
    struct SearchRepositories: GithubRequest {
        let keyeord: String
        
        // GithubRequest が要求する連想型
        typealias Response = SearchResponse<Repository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var parameters: Any? {
            return ["q": keyeord]
        }
    }
    
    struct SearchUsers: GithubRequest {
        let keyword: String
        
        typealias Response = SearchResponse<User>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/users"
        }
        
        var parameters: Any? {
            return ["q": keyword]
        }
    }
}
