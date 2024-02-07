//
//  RegisterPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class RegisterPresenter: ViewToPresenterRegisterProtocol {

    // MARK: Properties
    var view: PresenterToViewRegisterProtocol?
    var interactor: PresenterToInteractorRegisterProtocol?
    var router: PresenterToRouterRegisterProtocol?
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    
}
