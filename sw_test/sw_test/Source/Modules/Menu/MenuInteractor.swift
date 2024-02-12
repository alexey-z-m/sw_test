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
        //idCafe: Int
//        orderedItems.append((item: MenuModel(id: 1, name: "булка", imageURL: "булка", price: 20), count:  0))
//        orderedItems.append((item: MenuModel(id: 2, name: "кофе", imageURL: "булка", price: 120), count:  0))
//        orderedItems.append((item: MenuModel(id: 3, name: "чай", imageURL: "булка", price: 30), count:  0))
//        orderedItems.append((item: MenuModel(id: 4, name: "компот", imageURL: "булка", price: 50), count:  0))
//        orderedItems.append((item: MenuModel(id: 5, name: "второе", imageURL: "булка", price: 200), count:  0))
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

}
