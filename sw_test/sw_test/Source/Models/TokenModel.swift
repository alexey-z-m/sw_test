//
//  TokenModel.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//

import Foundation

struct TokenModel: Decodable {
    let token:  String
    let tokenLifetime: Int
}
