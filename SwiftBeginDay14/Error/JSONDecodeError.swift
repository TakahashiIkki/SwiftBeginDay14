//
//  JSONDecodeError.swift
//  SwiftBeginDay14
//
//  Created by 髙橋一騎 on 2018/06/12.
//  Copyright © 2018年 髙橋一騎. All rights reserved.
//

import Foundation

/// JSONDecodeが失敗した時にthrowされる事が想定されるエラー型
/// Errorプロトコルに準拠している。
///
/// - invalidFormat: JSONの構造が期待値と異なる
/// - missingValue: 構造体を初期化する為のパラメータが足りなかったなど。
enum JSONDecodeError: Error {
    case invalidFormat(json: Any)
    case missingValue(key: String, actualValue: Any?)
}
