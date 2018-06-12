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
        completion: @escaping (Result<Request.Response, GithubClientError> ) -> Void) {
        
        let urlRequest = request.buildURLRequest()
        let task = session.dataTask(with: urlRequest) {
            data, response, error in
            switch (data, response, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            case (let data?, let response?, _):
                do {
                    let response = try request.response(from: data, urlResponse: response)
                    
                    completion(Result(value: response))
                } catch let error as GithubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            default:
                fatalError("invalid response combination \(data), \(response), \(error) .")
            }
        }
        
        task.resume()
    }
}
