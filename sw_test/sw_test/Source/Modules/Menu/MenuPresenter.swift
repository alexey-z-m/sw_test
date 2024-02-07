//
//  MenuPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class MenuPresenter: ViewToPresenterMenuProtocol {

    // MARK: Properties
    var view: PresenterToViewMenuProtocol?
    var interactor: PresenterToInteractorMenuProtocol?
    var router: PresenterToRouterMenuProtocol?
}

extension MenuPresenter: InteractorToPresenterMenuProtocol {
    
}
