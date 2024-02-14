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

    func plusItem(item: MenuModel) {
        if let index = orderedItems.firstIndex(where: { $0.item.id == item.id }) {
            orderedItems[index].count += 1
        }
        print(orderedItems)
    }

    func minusItem(item: MenuModel) {
        if let index = orderedItems.firstIndex(where: { $0.item.id == item.id }) {
            orderedItems[index].count -= 1
        }
        print(orderedItems)
    }
}
