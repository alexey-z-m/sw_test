//
//  MenuInteractor.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation

class MenuInteractor: MenuInteractorProtocol {
    var idCafe: Int
    init(idCafe: Int) {
        self.idCafe = idCafe
    }

    var presenter: MenuPresenterProtocol?

    var orderedItems: [(item: MenuModel, count: Int)] = []

    func getMenu(completion: @escaping(Result<[MenuModel],Error>) -> ()) {
        Network.shared.getMenu(idCafe: idCafe) { [weak self] result in
            switch result {
            case .success(let menu):
                menu.forEach { item in
                    self?.orderedItems.append((item:item, count: 0))
                }
                completion(.success(menu))
            case .failure(_): print("getMenu fail")
            }
        }
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
