//
//  GithubClient.swift
//  SwiftBeginDay14
//
//  Created by 一騎高橋 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

/// APIクライアントがレスポンスを取得する際に発生し得るエラーの定義
///
/// - connectionError: 通信に失敗したときのエラー
/// - responseParseError: レスポンスの解釈に失敗したときのエラー
/// - apiError: APIからエラーレスポンスを受け取ったときの例
enum GithubClient: Error {
    case connectionError(Error)
    case responseParseError(Error)
    case apiError(GithubAPIError)
}
