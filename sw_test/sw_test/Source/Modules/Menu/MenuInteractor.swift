//
//  MenuInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class MenuInteractor: MenuInteractorProtocol {

    var presenter: MenuPresenterProtocol?

    private var orderedItems: [MenuModel: Int] = [:]

    func plusItem(item: MenuModel) {
        if orderedItems.contains(where: { $0.key == item }) {
            orderedItems[item]! += 1
        } else {
            orderedItems[item] = 1
        }
    }

    func minusItem(item: MenuModel) {
        if orderedItems.contains(where: { $0.key == item }) {
            if orderedItems[item] == 1 {
                orderedItems.removeValue(forKey: item)
            }
            else {
                orderedItems[item]! -= 1
            }
        }
    }
}
