//
//  MapPresenter.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 07.02.2024.
//  
//

import Foundation

class MapPresenter: ViewToPresenterMapProtocol {

    // MARK: Properties
    var view: PresenterToViewMapProtocol?
    var interactor: PresenterToInteractorMapProtocol?
    var router: PresenterToRouterMapProtocol?
}

extension MapPresenter: InteractorToPresenterMapProtocol {
    
}
