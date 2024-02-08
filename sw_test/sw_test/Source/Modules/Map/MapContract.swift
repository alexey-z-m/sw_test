//
//  MapContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol MapViewProtocol: AnyObject {

}

protocol MapPresenterProtocol {
    
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol { get set }
    var router: MapRouterProtocol { get set }
}

protocol MapInteractorProtocol {

    var presenter: MapPresenterProtocol? { get set }
}

protocol MapRouterProtocol {

}
