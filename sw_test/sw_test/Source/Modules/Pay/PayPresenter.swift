//
//  PayPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class PayPresenter: ViewToPresenterPayProtocol {

    // MARK: Properties
    var view: PresenterToViewPayProtocol?
    var interactor: PresenterToInteractorPayProtocol?
    var router: PresenterToRouterPayProtocol?
}

extension PayPresenter: InteractorToPresenterPayProtocol {
    
}
