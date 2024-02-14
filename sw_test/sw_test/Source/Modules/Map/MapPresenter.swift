//
//  MapPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class MapPresenter: MapPresenterProtocol {

    // MARK: Properties
    weak var view: MapViewProtocol?
    var interactor: MapInteractorProtocol
    var router: MapRouterProtocol

    init(interactor: MapInteractorProtocol, router: MapRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view?.addPoints(cafesList: interactor.getCafes())
    }

    func menu(idCafe: Int) {
        router.menu(idCafe: idCafe)
    }

}
