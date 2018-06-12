//
//  JSONDecodable.swift
//  SwiftBeginDay14
//
//  Created by 髙橋一騎 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

/// JSONを展開して初期化する為のイニシャライザを持つ型の共通イニシャライザの形式を定義。
protocol JSONDecodable {
    init(json: Any) throws
}
