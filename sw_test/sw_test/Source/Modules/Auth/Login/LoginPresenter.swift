//
//  LoginPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class LoginPresenter: ViewToPresenterLoginProtocol {

    // MARK: Properties
    var view: PresenterToViewLoginProtocol?
    var interactor: PresenterToInteractorLoginProtocol?
    var router: PresenterToRouterLoginProtocol?
}

extension LoginPresenter: InteractorToPresenterLoginProtocol {
    
}
