//
//  RegisterPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

class RegisterPresenter: RegisterPresenterProtocol {

    // MARK: Properties
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorProtocol
    var router: RegisterRouterProtocol

    init(interactor: RegisterInteractorProtocol, router: RegisterRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func registerProfile() {
        router.registerProfile()
    }
}
