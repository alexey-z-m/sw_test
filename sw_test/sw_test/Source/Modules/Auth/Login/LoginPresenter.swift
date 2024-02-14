//
//  LoginPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//
//

import Foundation

class LoginPresenter  {

    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorProtocol
    var router: LoginRouterProtocol

    init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

}

extension LoginPresenter: LoginPresenterProtocol {

    func register() {
        router.register()
    }

    func login(login: String, password: String) {
        interactor.login(login: login, password: password) { [weak self] result in
            switch result {
            case .success(_):
                self?.router.login()
            case .failure(_):
                print("+++ login fail")
            }
        }
    }
}
