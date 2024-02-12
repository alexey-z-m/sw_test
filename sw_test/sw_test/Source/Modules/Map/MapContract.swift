//
//  MapContract.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import Foundation

protocol MapViewProtocol: AnyObject {
    func addPoints(cafesList: [LocationsModel])
}

protocol MapPresenterProtocol {
    
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorProtocol { get set }
    var router: MapRouterProtocol { get set }

    func viewDidLoad()
}

protocol MapInteractorProtocol {

    var presenter: MapPresenterProtocol? { get set }
    func getCafes() -> [LocationsModel]
}

protocol MapRouterProtocol {

}
