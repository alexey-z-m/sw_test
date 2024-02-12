//
//  ListPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class ListPresenter: ListPresenterProtocol {

    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorProtocol
    var router: ListRouterProtocol

    init(interactor: ListInteractorProtocol, router: ListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.getCafeList { [weak self] result in
            switch result {
            case .success(_):
                self?.view?.tableView.reloadData()
            case .failure(_):
                print("getCafe fail")
            }
        }
    }

    func map() {
        router.map()
    }

    func menu(idCafe: Int) {
        router.menu(idCafe: idCafe)
    }
}
