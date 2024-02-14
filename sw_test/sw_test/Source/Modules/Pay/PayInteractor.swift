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

    var orderedItems: [ItemModel]

    init(orderedItems: [ItemModel]) {
        self.orderedItems = orderedItems
    }

    func plusItem(item: MenuModel) {
        if let index = orderedItems.firstIndex(where: { $0.item.id == item.id }) {
            orderedItems[index].count += 1
        }
    }

    func minusItem(item: MenuModel) {
        if let index = orderedItems.firstIndex(where: { $0.item.id == item.id }) {
            orderedItems[index].count -= 1
        }
    }

    func fullPrice(price: Double, count: Int) -> String {
        return String(format: "%.2f", price * Double(count))
    }
}
