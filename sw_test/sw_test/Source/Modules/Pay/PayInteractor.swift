//
//  PayInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class PayInteractor: PayInteractorProtocol {

    var presenter: PayPresenterProtocol?

    var orderedItems: [(item: MenuModel, count: Int)]

    init(orderedItems: [(item: MenuModel, count: Int)]) {
        self.orderedItems = orderedItems
    }
}
