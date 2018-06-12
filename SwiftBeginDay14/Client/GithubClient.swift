//
//  GithubClient.swift
//  SwiftBeginDay14
//
//  Created by 一騎高橋 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

class GithubClient {
    private let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        return session
    }()
    
    func send<Request : GithubRequest>(
        request: Request,
        completion: (Result<Request.Response, GithubClientError> ) -> Void) {
        
    }
}
