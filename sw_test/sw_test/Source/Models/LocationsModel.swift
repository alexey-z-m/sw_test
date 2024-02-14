//
//  LocationsModel.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//

import Foundation

struct LocationsModel: Decodable {
    let id: Int
    let name: String
    let point: LocPointModel
}
