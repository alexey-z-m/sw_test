//
//  MapModuleBuilder.swift
//  sw_test
//
//  Created by Alexey Zablotskiy on 08.02.2024.
//  
//

import UIKit

class MapModuleBuilder {

    static func build(cafeList: [LocationsModel]) -> UIViewController {
        let interactor = MapInteractor(cafeList: cafeList)
        let router = MapRouter()
        let presenter = MapPresenter(interactor: interactor, router: router)
        let viewController = MapViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
