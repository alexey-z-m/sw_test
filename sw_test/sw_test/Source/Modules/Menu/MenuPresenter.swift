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

    func viewDidLoad() {
        interactor.getMenu { [weak self] result in
            switch result {
            case .success(_): self?.view?.collectionView.reloadData()
            case .failure(_): print("viewDidLoad fail")
            }
        }
    }

    func pay() {
        let orderedItems = interactor.menuItems.filter{ $0.count > 0 }
        router.pay(orderedItems: orderedItems)
    }
}

extension MenuPresenter: ItemDelegate {

    func plusItem(item: MenuModel) {
        interactor.plusItem(item: item)
    }
    func minusItem(item: MenuModel) {
        interactor.minusItem(item: item)
    }
}
