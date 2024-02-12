//
//  CustomError.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 12.02.2024.
//

import Foundation

class CustomError: Error {
    var message: String

    init(message: String) {
        self.message = message
    }
}
