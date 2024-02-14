//
//  PayContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol PayViewProtocol: AnyObject {

}

protocol PayPresenterProtocol: AnyObject, ItemDelegate {

    var view: PayViewProtocol? { get set }
    var interactor: PayInteractorProtocol { get set }
    var router: PayRouterProtocol { get set }

    func pay()
}

protocol PayInteractorProtocol {

    var presenter: PayPresenterProtocol? { get set }
    var orderedItems: [ItemModel] { get }

    func plusItem(item: MenuModel)
    func minusItem(item: MenuModel)
}

protocol PayRouterProtocol {
    func pay()
}

