//
//  MenuPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class MenuPresenter: MenuPresenterProtocol {

    // MARK: Properties
    weak var view: MenuViewProtocol?
    var interactor: MenuInteractorProtocol
    var router: MenuRouterProtocol

    init(interactor: MenuInteractorProtocol, router: MenuRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func pay() {
        router.pay()
    }

    func plusItem(item: MenuModel) {
        interactor.plusItem(item: item)
    }
    func minusItem(item: MenuModel) {
        interactor.minusItem(item: item)
    }
}
