//
//  GithubRequest.swift
//  SwiftBeginDay14
//
//  Created by 一騎高橋 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

protocol GithubRequest {
    associatedtype Response: JSONDecodable
    
    var baseURL: URL { get }
    var path: String { get }
    var method : HTTPMethod { get }
    var parameters : Any? { get }
    
}

extension GithubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
}
