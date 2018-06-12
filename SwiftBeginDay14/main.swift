//
//  main.swift
//  SwiftBeginDay14
//
//  Created by 髙橋一騎 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

print("Enter Your Query here> ", terminator: "")

guard let keyword = readLine(strippingNewline: true) else {
    exit(1)
}

// APIクライアントの生成

let clinent = GithubClient()

// リクエストの発行
let request = GithubAPI.SearchRepositories(keyeord: keyword)

clinent.send(request: request) { result in
    switch result {
    case let .success(response):
        for item in response.items {
            // レポジトリの所有者と名前を出力
            print(item.owner.login + "/" + item.name)
        }
        exit(0)
    case let .failure(error):
        print(error)
        exit(1)
    }
}


// タイムアウト時間
let timeoutInterval: TimeInterval = 60

// タイムアウトまでメインスレッドを停止
Thread.sleep(forTimeInterval: timeoutInterval)

// タイムアウト後の処理
print("Connection timeout")
exit(1)
