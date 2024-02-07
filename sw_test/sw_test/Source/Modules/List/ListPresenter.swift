//
//  ListPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class ListPresenter: ViewToPresenterListProtocol {

    // MARK: Properties
    var view: PresenterToViewListProtocol?
    var interactor: PresenterToInteractorListProtocol?
    var router: PresenterToRouterListProtocol?
}

extension ListPresenter: InteractorToPresenterListProtocol {
    
}
