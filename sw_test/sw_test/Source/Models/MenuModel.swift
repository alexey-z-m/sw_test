//
//  MenuModel.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//

import Foundation

struct MenuModel: Decodable, Hashable {
    let id: Int
    let name: String
    let imageURL: String
    let price: Double
}
