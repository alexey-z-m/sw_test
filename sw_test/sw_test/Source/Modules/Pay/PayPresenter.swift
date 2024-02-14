//
//  PayPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class PayPresenter: PayPresenterProtocol {

    // MARK: Properties
    weak var view: PayViewProtocol?
    var interactor: PayInteractorProtocol
    var router: PayRouterProtocol

    init(interactor: PayInteractorProtocol, router: PayRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func pay() {
        router.pay()
    }
}

extension PayPresenter: ItemDelegate {
    func plusItem(item: MenuModel) {
        interactor.plusItem(item: item)
    }
    
    func minusItem(item: MenuModel) {
        interactor.minusItem(item: item)
    }
    
    
}
